//
//  AppComponents.swift
//  BCommerce
//
//  Created by Gabriel on 10/02/2026.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    var backgroundColor: Color = .brandPrimary
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 12
    var height: CGFloat = 54
    var width: CGFloat = .infinity
    let action: () -> Void
 
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(foregroundColor)
                .frame(maxWidth: width)
                .frame(height: height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}
