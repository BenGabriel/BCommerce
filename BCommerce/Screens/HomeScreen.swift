//
//  HomeScreen.swift
//  BCommerce
//
//  Created by Gabriel on 04/03/2026.
//

import SwiftUI

struct Categories: Hashable {
    var name: String;
    var icon: String
}

struct HomeScreen: View {
    @Environment(AppRouter.self) private var router
    
    @State private var search: String = ""
    @State private var selectJustForYou: String = "All"
    
    private var category: [Categories] = [
        Categories(name: "Clothing", icon: "tshirt.fill"),
        Categories(name: "Medicine", icon: "pills.fill"),
        Categories(name: "Beauty", icon: "paintbrush.pointed.fill"),
        Categories(name: "Baby", icon: "face.smiling.inverse")
    ]
    
    private var justForYou: [String] = ["All", "Popular", "Newest", "Most Sell", "Most Recent"]
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundStyle(Color.brandPrimary)
                        
                        Text("New york, USA")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "chevron.down")
                            .foregroundStyle(Color.brandPrimary)
                        Spacer()
                        Image(systemName: "bell.badge.fill")
                            .symbolEffect(.bounce.up.wholeSymbol, options: .nonRepeating)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        CustomTextInput(text: $search, placeholder: "Search", icon: "magnifyingglass", iconColor: Color.secondary)
                        Button {
                            
                        } label :{
                            Image(systemName: "slider.horizontal.3")
                                .padding(.all, 20)
                                .foregroundStyle(.white)
                                .background(Color.brandPrimary)
                                .clipShape(.rect(cornerRadius: 12))
                                .padding(.leading, 20)
                                .padding(.bottom, 7)
                               
                            
                        }
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("New Collections".uppercased())
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .regular))
                        
                        Text("2024")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                        Button {
                            
                        } label :{
                            Text("Buy Now")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(Color.brandPrimary)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.white)
                                .clipShape(.rect(cornerRadius: 8))
                              
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.brandPrimary)
                    .clipShape(.rect(cornerRadius: 12))
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Categories")
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
                        Text("See All")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(Color.brandPrimary)
                    }

                    HStack {
                        ForEach(category, id: \.self) { category in
                            VStack(spacing: 10) {
                                Image(systemName: category.icon)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color.brandPrimary)
                                    .frame(width: 60, height: 60)
                                    .background(Color(hex: "#f6f6f6"))
                                    .clipShape(.rect(cornerRadius: 30))
                                
                                Text(category.name)
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                          
                        }
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Just For You")
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
              
                    }
                    .padding(.bottom, 10)
                
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(justForYou, id: \.self) { justForYou in

                                Button {
                                    selectJustForYou = justForYou
                                } label: {
                                    Text(justForYou)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(justForYou == selectJustForYou ? Color.white : Color.black)
                                        .padding(.horizontal, 24)
                                        .padding(.vertical, 14)
                                        .background(justForYou == selectJustForYou ?Color.brandPrimary :Color(hex: "#f6f6f6"))
                                        .clipShape(.rect(cornerRadius: 8))
                                }
                             
                            }
                        }
                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible())], spacing: 10) {
                        ForEach(1...4, id: \.self) { number in
                          
                                ProductItem {
                                    router.push(.productDetails, in: .home)
                                }
                     
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded {
                                print("NavigationLink tapped \(number)")
                            })
                            
                          
                        }
                    }.padding(.bottom, 10)
                                        
                    
                    HStack {
                        Text("Invite Friends")
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
                        Text("See All")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(Color.brandPrimary)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(1...2, id: \.self) { number in
                                VStack(alignment: .leading, spacing: 10) {
                                    Image(systemName:"person")
                                        .font(.system(size: 100))
                                        .frame(maxWidth:.infinity, alignment: .center)
                                        .padding(.bottom, 10)
                                    Text("Invite Friend")
                                        .font(.system(size: 14, weight: .semibold))
                                    Text("Share code with two of your friends and family members")
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.secondary)
                                        .padding(.bottom, 10)
                                    
                                    Text("Share the code")
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.secondary)
                                    HStack {
                                        Text("N2X1Y")
                                            .font(.system(size: 14, weight: .bold))
                                        Spacer()
                                        Image(systemName:"document.on.document")
                                            .font(.system(size: 20))
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .background(.white)
                                    .clipShape(.rect(cornerRadius: 10))
                                    
                   
                                        HStack{
                                            CustomButton(title:"Invite", backgroundColor: .white, foregroundColor: .black, height: 40) {
                                
                                            }
                                            Spacer()
                                            CustomButton(title:"Details", height: 40) {
                                          
                                            }
                                            
                                            
                                         
                                        }
                                    
                                }
                                .padding()
                                .frame(width: 300)
                                .background(Color(hex:"#f6f6f6"))
                                .clipShape(.rect(cornerRadius: 12))
                              
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environment(AppRouter())
}
