//
//  ForgotPasswordScreen.swift
//  BCommerce
//
//  Created by Gabriel on 11/02/2026.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var emailAddress: String = ""
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10){
                    AuthHeader(title: "Forgot Password")
                        .padding(.bottom, 30)
                    
                    CustomTextInput(text: $emailAddress, placeholder: "Email Address").padding(.bottom, 20)
        
                    CustomButton(title: "Send Code") {
                        router.navigate(to: .enterResetCode)
                    }
                    
                    Spacer()
                    HStack {
                        Text("Go back to")
                            .font(.system(size: 15))
                        Button {
                            router.navigate(to: .login)
                        } label: {
                            Text("Sign In")
                                .foregroundStyle(Color.brandPrimary)
                                .underline()
                                .font(.system(size: 15, weight: .bold))
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
                .frame(minHeight: UIScreen.main.bounds.height - 100)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ForgotPasswordScreen()
}
