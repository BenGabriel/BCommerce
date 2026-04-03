//
//  SignUpScreen.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @State private var userPassword: String = ""
    @State private var toggleBox: Bool = false
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10){
                    AuthHeader(title: "Sign Up")
                        .padding(.bottom, 30)
                    CustomTextInput(text: $fullName, placeholder: "Full Name")
                    CustomTextInput(text: $emailAddress, placeholder: "Email Address")
                    CustomTextInput(text: $userPassword, placeholder: "Password", isSecure: true)
                    
                    
                    HStack(spacing: 10) {
                        CustomCheckbox(isChecked: $toggleBox)
                        Text("I agree to terms and conditions")
                            .font(.system(size: 14))
                        Spacer()
                    }.padding(.bottom, 30)
                        .padding(.top, 6)
                    
                    CustomButton(title: "Sign Up") {
                        
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
                        Text("Already have an Account")
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
    SignUpScreen()
}
