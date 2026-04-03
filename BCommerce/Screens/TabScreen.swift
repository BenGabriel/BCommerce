//
//  TabScreen.swift
//  BCommerce
//
//  Created by Gabriel on 04/03/2026.
//

import SwiftUI

struct TabScreen: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        
        @Bindable var router = router
        
        TabView(selection: $router.selectedTab) {
            Tab("Home", systemImage: "house.fill", value: AppTab.home) {
                NavigationStack(path: $router.homePath) {
                    HomeScreen()
                        .navigationDestination(for: HomeRoute.self) { route in
                            switch route {
                            case .productDetails: ProductDetails()
                            }
                        }
                }
            }
            Tab("Wishlist", systemImage: "heart.fill", value: AppTab.wishlist) {
                NavigationStack(path: $router.wishlistPath) {
                    WishListScreen()
                        .navigationDestination(for: HomeRoute.self) { route in
                            switch route {
                            case .productDetails: ProductDetails()
                            }
                        }
                }
            }
            Tab("Cart", systemImage: "bag.fill", value: AppTab.cart) {
                CartScreen()
            }
            Tab("Chat", systemImage: "message", value: AppTab.chat) {
                ChatScreen()
            }
            Tab("Profile", systemImage: "person", value: AppTab.profile) {
                ProfileScreen()
            }
        }
        .tint(Color.brandPrimary)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TabScreen()
        .environment(AppRouter())
}

