
//
//  WelcomeScreen.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//

import SwiftUI

struct SWelcomePage {
    let id = UUID()
    let imageName: String
    let title: String
}

struct WelcomeScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var currentPage = 0

    let pages = [
        SWelcomePage(imageName: "Welcome1", title: "Endless Choices, Easy & Quick Purchase"),
        SWelcomePage(imageName: "Welcome2", title: "Dive Into a Hassel-Free Shopping Experience"),
        SWelcomePage(imageName: "Welcome3", title: "Find All You Need Online, Explore & Easy"),
        SWelcomePage(imageName: "Welcome4", title: "Dive Into A World Of Convenience"),
    ]
    var body: some View {
        ZStack{
            Color(hex: "#F5F5F5").ignoresSafeArea()
            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        WelcomeView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)
                
                VStack (spacing: 0){
                    if currentPage == 3 {
                        HStack{
                            CustomButton(title:"Sign up") {
                                router.navigate(to: .signup)
                            }
                            
                            Spacer()
                            
                            CustomButton(title:"Sign In", backgroundColor: Color(hex:"#e5e5e5"), foregroundColor: .black) {
                                router.navigate(to: .login)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 28)
                        .background(.white)
                    } else {
                        HStack{
                            Button {
                                withAnimation {
                                    currentPage = 3
                                }
                            } label:{
                                Text("Skip")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 12, weight: .bold))
                            }
                            
                            Spacer()
                            Pager(numberOfPages: pages.count - 1, currentPage: currentPage)
                            Spacer()
                            
                            Button {
                                if currentPage < pages.count - 1 {
                                    withAnimation {
                                        currentPage += 1
                                    }
                                }
                                
                            } label: {
                                Circle()
                                    .fill(Color.brandPrimary)
                                    .frame(width: 40, height: 40)
                                    .overlay (
                                        Image(systemName: "arrow.right")
                                            .foregroundStyle(.white)
                                    )
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 34)
                        .background(.white)
                    }
                }
                .background(.white)
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct WelcomeView: View {
    let page: SWelcomePage
    
    var body: some View {
        VStack {
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 400, height: 500)
            
            VStack (spacing: 20){
                Text(page.title)
                    .font(.system(size: 30, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color(hex: "#707070"))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 30)
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 60)
            .background(.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius:30,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 30
                )
            )
        }
    }
}


struct Pager: View {
    let numberOfPages: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(currentPage == index ? Color.brandPrimary : Color.gray.opacity(0.3))
                    .frame(width: currentPage == index ? 24 : 8, height: 8)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
