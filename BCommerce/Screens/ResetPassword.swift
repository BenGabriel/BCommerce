//
//  ResetPassword.swift
//  BCommerce
//
//  Created by Gabriel on 11/02/2026.
//

import SwiftUI

struct ResetPassword: View {
    @Environment(AppRouter.self) private var router
    @State private var confirmPassword: String = ""
    @State private var userPassword: String = ""
    @State private var showModal : Bool = false
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10){
                    AuthHeader(title: "Reset Password")
                        .padding(.bottom, 30)
                    CustomTextInput(text: $userPassword, placeholder: "New Password", isSecure: true)
                    CustomTextInput(text: $confirmPassword, placeholder: "Confirm Password", isSecure: true)
                        .padding(.bottom, 30)
                    CustomButton(title: "Reset Password") {
                        showModal.toggle()
                    }

                }
                .padding(.horizontal, 20)
            }.overlayModal(isPresented: $showModal) {
             
                VStack(spacing: 24) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 100))
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.brandPrimary)
                    Text("New password set Successfully!!")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Lorem Ipsum is simply dummy text")
                        .foregroundStyle(Color.secondary)
                    
                    CustomButton(title: "Go to home") {
                        showModal.toggle()
                        router.navigateBackTo(.login)
                    }
                    .padding(.bottom, 40)
                    .frame(width: 250)
                }
                .frame(width: UIScreen.main.bounds.width - 90)
            }
//
//            if showModal {
//                         ZStack {
//                             // Dimmed background
//                             Color.black.opacity(0.4)
//                                 .ignoresSafeArea()
//                                 .onTapGesture {
//                                     showModal = false // Tap outside to dismiss
//                                 }
//
//                             // Modal card
//                             VStack(spacing: 16) {
//                                 Text("Modal Title")
//                                     .font(.headline)
//
//                                 Text("This is a transparent overlay modal.")
//                                     .multilineTextAlignment(.center)
//
//                                 Button("Dismiss") {
//                                     showModal = false
//                                 }
//                                 .buttonStyle(.borderedProminent)
//                             }
//                             .padding(24)
//                             .background(.white)
//                             .cornerRadius(16)
//                             .shadow(radius: 20)
//                             .padding(.horizontal, 32)
//                         }
//                         .transition(.opacity) // Fade in/out
//                     }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Hello from Modal!")
            Button("Dismiss") { dismiss() }
        }
    }
}

#Preview {
    ResetPassword()
}
