//
//  ProductDetails.swift
//  BCommerce
//
//  Created by Gabriel on 23/03/2026.
//

import SwiftUI

struct ProductDetails: View {
    private var images = ["fan.oscillation", "car", "tshirt.fill"]
    private var clothColors: [String] = ["White", "Black", "Blue", "Red"]
    private var sizes: [String] = ["S", "M", "L", "XL", "XXL"]
    
    @State private var currentIndex = 0
    @State private var eachColor = "White"
    @State private var eachSize = "S"
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                AppHeader(title: "Product Details") {
                    Button{
                        
                    } label: {
                        Circle()
                            .fill(Color(hex: "#f6f6f6"))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(Color.brandPrimary)
                                    .fontWeight(.semibold)
                            )
                    }
                }
                .padding(.horizontal, 16)
                ScrollView (showsIndicators: false){
                    VStack(alignment: .leading) {
                        TabView(selection: $currentIndex) {
                            ForEach(images.indices, id: \.self) { index in
                                Image(systemName: images[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: 200)
                        .padding(.top, 30)
                        
                        HStack(spacing: 8) {
                            ForEach(images.indices, id: \.self) { index in
                                Capsule()
                                    .fill(currentIndex == index ? Color.brandPrimary : Color.gray.opacity(0.3))
                                    .frame(width: currentIndex == index ? 24 : 8, height: 8)
                                    .animation(.spring(duration: 0.3), value: currentIndex)
                            }
                        }.padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Black Fan")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.bottom, 3)
                                Text("Clothing")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("4.6")
                                .fontWeight(.semibold)
                            
                        }
                        .padding(.vertical, 20)
                        
                        Text("About Product")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.bottom, 3)
                        
                        Text("Xcode provides built-in tools for re-indenting and advanced formatting, though full auto-formatting often requires external plugins for a format on save experience.")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                        
                        
                        Text("Choose Color")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical, 20)
                        
                        HStack {
                            ForEach(clothColors, id: \.self) { clothColor in
                                
                                Button {
                                    eachColor = clothColor
                                } label: {
                                    Text(clothColor)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor(eachColor == clothColor ? Color.white : Color.black)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(eachColor == clothColor ? Color.brandPrimary :Color(hex: "#f6f6f6"))
                                        .clipShape(.rect(cornerRadius: 4))
                                }
                                
                            }
                        }
                        
                        Text("Select Size")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical, 20)
                        
                        HStack {
                            ForEach(sizes, id: \.self) { size in
                                
                                Button {
                                    eachSize = size
                                } label: {
                                    Text(size)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor( eachSize == size ? Color.white : Color.black)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background( eachSize == size ? Color.brandPrimary :Color(hex: "#f6f6f6"))
                                        .clipShape(.rect(cornerRadius: 4))
                                }
                                
                            }
                        }
                        .padding(.bottom, 30)
                        
                        Text("Rating & Reviews")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.bottom, 3)
                        
                        Text("Xcode provides built-in tools for re-indenting and advanced formatting, though full auto-formatting often")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                            .padding(.bottom, 30)
                        
                        EachReviewItem()
                        EachReviewItem()
                    }
                    
                }
                .padding(.horizontal, 16)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total Price")
                            .font(.headline)
                            .foregroundStyle(Color.gray)
                            .padding(.bottom, 3)
                        
                        Text("$15.99")
                            .font(.system(size: 24, weight: .bold))
                    }
                    Spacer()
                    CustomButton(title: "Add to Cart", width: 200) {
                        
                    }
                }
                .padding(.all, 20)
                .frame(maxWidth: .infinity)
                .background(Color(hex:"#f6f6f6"))
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .toolbarVisibility(.hidden, for: .tabBar)
        
    }
    
}

#Preview {
    ProductDetails()
}
