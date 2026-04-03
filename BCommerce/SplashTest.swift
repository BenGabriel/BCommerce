//
//  SplashTest.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//



//import SwiftUI
//
//// MARK: - Onboarding Page Model
//struct OnboardingPage: Identifiable {
//    let id = UUID()
//    let imageName: String
//    let title: String
//    let description: String
//}
//
//// MARK: - Main Onboarding View
//struct OnboardingView: View {
//    @State private var currentPage = 0
//    @State private var isOnboardingComplete = false
//
//    let pages = [
//        OnboardingPage(
//            imageName: "star.fill",
//            title: "Welcome",
//            description: "Discover amazing features that will transform your experience"
//        ),
//        OnboardingPage(
//            imageName: "heart.fill",
//            title: "Easy to Use",
//            description: "Simple and intuitive interface designed just for you"
//        ),
//        OnboardingPage(
//            imageName: "bolt.fill",
//            title: "Get Started",
//            description: "Begin your journey with us today"
//        )
//    ]
//
//    var body: some View {
//        if isOnboardingComplete {
//            // Your main app view here
//            Text("Main App View")
//                .font(.largeTitle)
//        } else {
//            ZStack {
//                Color.blue.opacity(0.1)
//                    .ignoresSafeArea()
//
//                VStack(spacing: 20) {
//                    // Skip Button
//                    HStack {
//                        Spacer()
//                        Button("Skip") {
//                            isOnboardingComplete = true
//                        }
//                        .foregroundColor(.blue)
//                        .padding()
//                    }
//
//                    // TabView for pages
//                    TabView(selection: $currentPage) {
//                        ForEach(0..<pages.count, id: \.self) { index in
//                            OnboardingPageView(page: pages[index])
//                                .tag(index)
//                        }
//                    }
//                    .tabViewStyle(.page(indexDisplayMode: .never))
//                    .animation(.easeInOut, value: currentPage)
//
//                    // Custom Page Indicators
//                    PageIndicator(numberOfPages: pages.count, currentPage: currentPage)
//                        .padding(.bottom, 20)
//
//                    // Next/Get Started Button
//                    Button(action: {
//                        if currentPage < pages.count - 1 {
//                            withAnimation {
//                                currentPage += 1
//                            }
//                        } else {
//                            isOnboardingComplete = true
//                        }
//                    }) {
//                        Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(15)
//                            .padding(.horizontal, 40)
//                    }
//                    .padding(.bottom, 40)
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Individual Page View
//struct OnboardingPageView: View {
//    let page: OnboardingPage
//
//    var body: some View {
//        VStack(spacing: 30) {
//            Spacer()
//
//            // Icon
//            Image(systemName: page.imageName)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 150)
//                .foregroundColor(.blue)
//
//            // Title
//            Text(page.title)
//                .font(.system(size: 32, weight: .bold))
//                .multilineTextAlignment(.center)
//
//            // Description
//            Text(page.description)
//                .font(.body)
//                .foregroundColor(.gray)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 40)
//
//            Spacer()
//        }
//    }
//}
//
//// MARK: - Custom Animated Page Indicator
//struct PageIndicator: View {
//    let numberOfPages: Int
//    let currentPage: Int
//
//    var body: some View {
//        HStack(spacing: 8) {
//            ForEach(0..<numberOfPages, id: \.self) { index in
//                Capsule()
//                    .fill(currentPage == index ? Color.blue : Color.gray.opacity(0.3))
//                    .frame(width: currentPage == index ? 30 : 8, height: 8)
//                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
//            }
//        }
//    }
//}
//
//#Preview {
//    OnboardingView()
//}


import SwiftUI

// MARK: - Onboarding Page Model
struct OnboardingPage: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

// MARK: - Main Onboarding View
struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var isOnboardingComplete = false
    
    let pages = [
        OnboardingPage(
            imageName: "star.fill",
            title: "Welcome",
            description: "Discover amazing features that will transform your experience"
        ),
        OnboardingPage(
            imageName: "heart.fill",
            title: "Easy to Use",
            description: "Simple and intuitive interface designed just for you"
        ),
        OnboardingPage(
            imageName: "bolt.fill",
            title: "Get Started",
            description: "Begin your journey with us today"
        )
    ]
    
    var body: some View {
        if isOnboardingComplete {
            // Your main app view here
            Text("Main App View")
                .font(.largeTitle)
        } else {
            ZStack {
                Color.blue.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Skip Button
                    HStack {
                        Spacer()
                        Button("Skip") {
                            isOnboardingComplete = true
                        }
                        .foregroundColor(.blue)
                        .padding()
                    }
                    
                    // TabView for pages
                    TabView(selection: $currentPage) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            OnboardingPageView(
                                page: pages[index],
                                isCurrentPage: currentPage == index
                            )
                            .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .onChange(of: currentPage) { oldValue, newValue in
                        // Trigger animations when page changes
                    }
                    
                    // Custom Page Indicators
                    PageIndicator(numberOfPages: pages.count, currentPage: currentPage)
                        .padding(.bottom, 20)
                    
                    // Next/Get Started Button
                    Button(action: {
                        if currentPage < pages.count - 1 {
                            withAnimation {
                                currentPage += 1
                            }
                        } else {
                            isOnboardingComplete = true
                        }
                    }) {
                        Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

// MARK: - Individual Page View with Animations
struct OnboardingPageView: View {
    let page: OnboardingPage
    let isCurrentPage: Bool
    
    @State private var imageScale: CGFloat = 0.5
    @State private var textOpacity: Double = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Animated Icon
            Image(systemName: page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .scaleEffect(imageScale)
                .animation(.spring(response: 0.6, dampingFraction: 0.7), value: imageScale)
            
            // Animated Title
            Text(page.title)
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .opacity(textOpacity)
                .animation(.easeIn(duration: 0.5).delay(0.2), value: textOpacity)
            
            // Animated Description
            Text(page.description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .opacity(textOpacity)
                .animation(.easeIn(duration: 0.5).delay(0.3), value: textOpacity)
            
            Spacer()
        }
        .onChange(of: isCurrentPage) { oldValue, newValue in
            if newValue {
                // Animate in when this page becomes active
                imageScale = 1.0
                textOpacity = 1.0
            } else {
                // Reset when page is not active
                imageScale = 0.5
                textOpacity = 0.0
            }
        }
        .onAppear {
            // Animate in on first appearance if this is the current page
            if isCurrentPage {
                imageScale = 1.0
                textOpacity = 1.0
            }
        }
    }
}

// MARK: - Custom Animated Page Indicator
struct PageIndicator: View {
    let numberOfPages: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(currentPage == index ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: currentPage == index ? 30 : 8, height: 8)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
