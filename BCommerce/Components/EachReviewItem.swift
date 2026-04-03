//
//  EachReviewItem.swift
//  BCommerce
//
//  Created by Gabriel on 03/04/2026.
//

import SwiftUI

struct EachReviewItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("Welcome1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 30))
                    .offset(y: -5)
                
                
                VStack(alignment: .leading) {
                    Text("Thomas Alva")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 2)
                    Text("1 hour ago")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray)
                }
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .font(.caption)
                Text("4.6")
                    .fontWeight(.semibold)
                    .font(.caption)
            }
            
            Text("Xcode provides built-in tools for re-indenting and advanced formatting, though full auto-formatting often requires external")
                .font(.footnote)
                .padding(.bottom, 20)
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundStyle(Color.brandPrimary)
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundStyle(.gray)
            }
        }
        .padding(EdgeInsets(top: 30, leading: 24, bottom: 20, trailing: 24))
        .background(Color(hex:"#f6f6f6"))
        .clipShape(.rect(cornerRadius: 8))
       
    }
}

#Preview {
    EachReviewItem()
}
