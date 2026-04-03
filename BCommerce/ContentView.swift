//
//  ContentView.swift
//  BCommerce
//
//  Created by Gabriel on 09/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var router = AppRouter()

      var body: some View {
          Group {
              switch router.authState {
              case .loggedOut:
                  AuthFlow()
              case .loggedIn:
                  TabScreen()
              }
          }
          .environment(router)
      }
}

#Preview {
    ContentView()
}
