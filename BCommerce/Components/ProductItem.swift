//
//  ProductItem.swift
//  BCommerce
//
//  Created by Gabriel on 23/03/2026.
//

import SwiftUI

struct ProductItem: View {
    var onSelect: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "fan.desk")
                .font(.system(size: 80))
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("Electric Fan")
                .font(.headline)
                .fontWeight(.bold)
            Text("QTY: 1")
                .font(.caption)
                .foregroundStyle(Color(hex:"#555555"))
            Text("Home Appliance")
                .font(.caption)
                .foregroundStyle(Color(hex:"#555555"))
                .padding(.bottom, 4)
            
            HStack
            {
                Text("$70.00")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "heart")
                
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 26)
        .background(Color(hex:"#f6f6f6"))
        .clipShape(.rect(cornerRadius: 10))
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onSelect()
        }
    }
}
