//
//  LoginScreen.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var emailAddress: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10){
                    AuthHeader(title: "Sign In")
                        .padding(.bottom, 30)
                    CustomTextInput(text: $emailAddress, placeholder: "Email Address")
                    CustomTextInput(text: $userPassword, placeholder: "Password", isSecure: true)
                    
                    
                    HStack {
                        Spacer()
                        Button {
                            router.navigate(to: .forgotPassword)
                        } label: {
                            Text("Forgot Password")
                                .foregroundStyle(Color.brandPrimary)
                                .underline()
                                .font(.system(size: 15, weight: .bold))
                        }
                    }.padding(.bottom, 30)
                        .padding(.top, 6)
                    
                    CustomButton(title: "Sign In") {
                        router.authState = .loggedIn 
                    }
                    
                    
                    HStack{
                        Rectangle()
                            .fill(Color(hex: "#cccccc"))
                            .frame(height: 1)
                        Text("Or")
                            .font(.system(size: 14))
                        Rectangle()
                            .fill(Color(hex: "#cccccc"))
                            .frame(height: 1)
                    }.padding(.vertical, 24)
                    
                    HStack{
                        Button{
                            
                        } label: {
                            Image("GoogleIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(.vertical)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(hex:"#f6f6f6"))
                                    
                                )
                        }
                        
                        Button{
                            
                        } label: {
                            Image("FacebookIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(.vertical)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(hex:"#f6f6f6"))
                                    
                                )
                        }
                    }
                    
                    
                    
                    Spacer()
                    HStack {
                        Text("Don't have an Account")
                            .font(.system(size: 15))
                        Button {
                            router.navigate(to: .signup)
                        } label: {
                            Text("Sign Up")
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
    LoginScreen()
        .environment(AppRouter())
}
