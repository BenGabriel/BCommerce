//
//  Constants.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//

import Foundation
import SwiftUI



extension Color {
    static let brandPrimary = Color(hex: "#3B32E3")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


// MARK: - Modal Modifier
struct OverlayModalModifier<ModalContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let modalContent: () -> ModalContent

    func body(content: Content) -> some View {
        ZStack {
            content

            overlayBackground
            modalCard
        }
    }

    // MARK: - Subviews
    private var overlayBackground: some View {
        Color.black.opacity(isPresented ? 0.5 : 0)
            .ignoresSafeArea()
            .onTapGesture {
                withAnimation(.spring(duration: 0.3)) {
                    isPresented = false
                }
            }
            .allowsHitTesting(isPresented)
    }

    private var modalCard: some View {
        modalContent()
            .padding(24)
            .background(Color.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.2), radius: 30, y: 10)
            .padding(.horizontal, 16)
            .scaleEffect(isPresented ? 1 : 0.95)
            .opacity(isPresented ? 1 : 0)
            .animation(.spring(duration: 0.3), value: isPresented)
            .allowsHitTesting(isPresented) // Disable interaction when hidden
    }
}

// MARK: - View Extension
extension View {
    func overlayModal<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(OverlayModalModifier(isPresented: isPresented, modalContent: content))
    }
}
