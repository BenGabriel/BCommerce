//
//  WishListScreen.swift
//  BCommerce
//
//  Created by Gabriel on 04/03/2026.
//

import SwiftUI

struct WishListScreen: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
          
            
            VStack {
                AppHeader(title: "Wishlist")
                    .padding(.bottom, 20)
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                        ], spacing: 10
                    ) {
                        ForEach(1...4, id: \.self) { number in
                            ProductItem{
                                router.push(.productDetails, in: .wishlist)
                            }
                        }
                    }.padding(.bottom, 10)
                    
                }
               
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    WishListScreen()
}
