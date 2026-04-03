//
//  AuthHeader.swift
//  BCommerce
//
//  Created by Gabriel on 11/02/2026.
//

import SwiftUI

struct AuthHeader: View {
    @Environment(AppRouter.self) private var router
    let title: String
    var body: some View {
        VStack(spacing: 20) {
            HStack (spacing: 0){
                Button{
                    router.navigateBack()
                } label: {
                    Circle()
                        .fill(Color(hex: "#f6f6f6"))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        )
                }
                Spacer()
            }
            
            Text(title)
                .font(.system(size: 30, weight: .semibold))
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color(hex: "#707070"))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 70)
            
        }
    }
}

