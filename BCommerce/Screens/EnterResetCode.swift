//
//  EnterResetCode.swift
//  BCommerce
//
//  Created by Gabriel on 14/02/2026.
//

import SwiftUI

struct EnterResetCode: View {
    @Environment(AppRouter.self) private var router
    @State private var otpText: String = ""
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10){
                    AuthHeader(title: "Reset Password")
                        .padding(.bottom, 30)
                    OTPTextField(numberOfFields: 4, otpText: $otpText)
                        .padding(.bottom, 30)
                    
                    Text("Resend code in 45 sec")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom, 30)
                    CustomButton(title: "Verify") {
                        router.navigate(to: .resetPassword)
                    }

                
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    EnterResetCode()
}
