//
//  AuthFlow.swift
//  BCommerce
//
//  Created by Gabriel on 23/03/2026.
//

import SwiftUI

struct AuthFlow: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.authPath) {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .shadow(radius: 3)
                        
                        Image("budg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 60, height: 60)
                    
                    Text("commerce")
                        .font(.system(size: 30, weight: .heavy))
                        .kerning(2)
                }
            }
            .navigationDestination(for: AuthRoute.self) { route in
                switch route {
                case .welcome:
                    WelcomeScreen()
                case .login :
                    LoginScreen()
                case .signup :
                    SignUpScreen()
                case .forgotPassword :
                    ForgotPasswordScreen()
                case .resetPassword :
                    ResetPassword()
                case .enterResetCode :
                    EnterResetCode()
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    router.navigate(to: .welcome)
                }
            }
            
        }
        .environment(router)
    }
}

#Preview {
    AuthFlow()
        .environment(AppRouter())
}
