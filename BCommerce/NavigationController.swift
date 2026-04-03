//
//  AppRouter.swift
//  BCommerce
//

import SwiftUI

enum AuthRoute: Hashable {
    case welcome
    case login
    case signup
    case forgotPassword
    case enterResetCode
    case resetPassword
}

enum AppTab: Hashable {
    case home, wishlist, cart, chat, profile
}

enum HomeRoute: Hashable {
    case productDetails
}

@Observable
class AppRouter {
    // MARK: - Auth state
    enum AuthState {
        case loggedOut
        case loggedIn
    }

    var authState: AuthState = .loggedOut

   
    // MARK: - Auth path
    var authPath: [AuthRoute] = []

    // MARK: - Tab state
    var selectedTab: AppTab = .home
    var homePath: [HomeRoute] = []
    var wishlistPath: [HomeRoute] = []
    var cartPath: [HomeRoute] = []

    // MARK: - Auth navigation
    func navigate(to route: AuthRoute) {
        authPath.append(route)
    }

    func navigateBackTo(_ route: AuthRoute) {
        guard let index = authPath.lastIndex(of: route) else { return }
        authPath.removeLast(authPath.count - index - 1)
    }
    
    func navigateBack() {
        guard !authPath.isEmpty else { return }
        authPath.removeLast()
    }

    func navigateToRoot() {
        authPath.removeAll()
    }

    // MARK: - App navigation
    func push(_ route: HomeRoute, in tab: AppTab = .home) {
        switch tab {
        case .home:     homePath.append(route)
        case .wishlist: wishlistPath.append(route)
        case .cart:     cartPath.append(route)
        default: break
        }
    }

    func popTab(_ tab: AppTab = .home) {
        switch tab {
        case .home:     if !homePath.isEmpty     { homePath.removeLast() }
        case .wishlist: if !wishlistPath.isEmpty { wishlistPath.removeLast() }
        case .cart:     if !cartPath.isEmpty     { cartPath.removeLast() }
        default: break
        }
    }

    // MARK: - Logout
    func logout() {
        authPath     = []
        homePath     = []
        wishlistPath = []
        cartPath     = []
        selectedTab  = .home
        authState    = .loggedOut
    }
}
