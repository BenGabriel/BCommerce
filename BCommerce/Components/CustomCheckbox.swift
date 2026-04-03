//
//  CustomCheckbox.swift
//  BCommerce
//
//  Created by Gabriel on 11/02/2026.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    let size:CGFloat = 16
    
    var body: some View {
        Button {
            withAnimation(
                .spring(response: 0.3, dampingFraction: 0.6)
            ) {
                isChecked.toggle()
            }
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.brandPrimary)
                    .frame(width: size, height: size)
                
                if isChecked {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.brandPrimary)
                        .frame(width: size, height: size)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: size * 0.6, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    CustomCheckbox(isChecked: .constant(true) )
}
