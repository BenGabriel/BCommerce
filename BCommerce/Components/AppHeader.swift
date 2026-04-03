//
//  AppHeader.swift
//  BCommerce
//
//  Created by Gabriel on 23/03/2026.
//

import SwiftUI

struct AppHeader<SideIcon: View>: View {
   
    let title: String
    let sideIcon:  SideIcon
    
    
    init(title: String, @ViewBuilder sideIcon: () -> SideIcon) {
           self.title = title
           self.sideIcon = sideIcon()
       }
       
    init(title: String) where SideIcon == EmptyView {
           self.title = title
           self.sideIcon = EmptyView()
       }
 
    var body: some View {
        HStack (spacing: 0){
            Button{
        
            } label: {
                Circle()
                    .fill(Color(hex: "#f6f6f6"))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    )
            }
            Spacer()
            Text(title)
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            sideIcon
        }
        
        
    }
}

