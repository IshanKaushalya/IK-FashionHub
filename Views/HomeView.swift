//
//  HomeView.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var productVM : ClothViewModel = ClothViewModel()
    @StateObject var userVM : UserViewModel = UserViewModel()

    @State private var showMenOptions = false
    @State private var showWomenOptions = false
    @State private var searchText = ""
    @State private var isSortingDescending = false // Default sorting order
    
    
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    
    var body: some View {
        NavigationStack{
            
            Text("IKFashionHub").font(.title).foregroundColor(Color.blue).padding(10)
                .bold()
            
            HStack{//the welcome note and the cart icon
                
                
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 330,height: 40)
                    .padding(.horizontal,10)
                    .opacity(0)
                    .overlay{
                        HStack{
                            HStack{
                                VStack{
                                    
                                    Text("Hello Welcome!").font(.custom("SF Armenian",size: 15))
                                    if userVM.authenticated {
                                        Text(userVM.username).bold()
                                    } else {
                                        Text("The IKFashionHub").bold()
                                    }
                                }
                            }
                            Spacer()
                            NavigationLink(destination:{
                                //EmptyView()
                                CartView()
                                //.toolbar(.hidden, for:.tabBar)
                            },label: {
                                CartButton(numberOfProducts: cartVM.items.count)
                            })
                            NavigationLink(destination: {
                                LoginView()
                            }, label: {
                                Image(systemName: "person.circle")
                                    .padding()
                            })
                            
                        }
                    }
                
            }
            .onAppear{
                if userVM.authenticated{
                    cartVM.fetchCartData(forEmail: userVM.username)
                }
            }
            
            
            NavigationView {
                
                HStack{
                    ScrollView {
                        
                        // Search Bar
                        TextField("Search products", text: $searchText)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onChange(of: searchText, perform: { value in
                                
                                productVM.fetchData(forQuery: searchText)
                            })
                        
                        
                        HStack{
                            HStack {
                                Button("Men") {
                                    productVM.fetchData(forCategory: "Men")
                                    showMenOptions.toggle()
                                    showWomenOptions = false
                                }
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                
                                Button("Women") {
                                    productVM.fetchData(forCategory: "Women")
                                    showWomenOptions.toggle()
                                    showMenOptions = false
                                }
                                .padding()
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            VStack {
                                Spacer()
                                Button(action: {
                                    isSortingDescending.toggle()
                                    productVM.fetchSortedData(order: isSortingDescending ? "desc" : "asc")
                                }) {
                                    VStack {
                                        Image(systemName: isSortingDescending ? "arrow.down" : "arrow.up")
                                            .foregroundColor(.black)
                                            .font(.system(size: 24))
                                            .padding()
                                        Text("Sort")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                            .padding(.leading, 150)
                            
                        }
                        
                        
                        if showMenOptions {
                            HStack {
                                TagButton(title: "Tops", action: {
                                    productVM.fetchData(forSubcategory: "Tops", inCategory: "Men")
                                })
                                TagButton(title: "Bottoms", action: {
                                    productVM.fetchData(forSubcategory: "Bottoms", inCategory: "Men")
                                })
                                
                            }
                        }
                        
                        if showWomenOptions {
                            HStack {
                                TagButton(title: "Party wear", action: {
                                    productVM.fetchData(forSubcategory: "Party wear", inCategory: "Women")
                                })
                                TagButton(title: "Office wear", action: {
                                    productVM.fetchData(forSubcategory: "Office wear", inCategory: "Women")
                                })
                                
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(productVM.clothingDM) { productData in
                                ClothingIcon(clothingDM: productData, userVM: userVM)
                            }.padding()
                            
                        }.navigationTitle(Text(""))
                        
                        
                        //                    .toolbar {
                        //
                        //                        NavigationLink {
                        //                             CartVeiw()
                        //                              .environmentObject(cartVM)
                        //                        } label: {
                        //                            CartIcon(numberOfProduct: cartVM.products.count)
                        //
                        //                        }
                        //
                        //                        NavigationLink {
                        //                            // UserView()
                        //                              .environmentObject(cartVM)
                        //                        } label: {
                        //                            Image(systemName: "person.circle")
                        //
                        //                        }
                        //                    }
                        
                        
                    }.navigationViewStyle(StackNavigationViewStyle())
                }
                
            }
            
            //        VStack {
            //
            //                    HStack {
            //                        Spacer()
            //
            //                        Button(action: {
            //
            //                        }) {
            //                            VStack {
            //                                Image(systemName: "house.fill")
            //                                    .foregroundColor(.blue)
            //                                    .font(.system(size: 24))
            //                                    .padding()
            //                                Text("Home")
            //                                    .foregroundColor(.blue)
            //                                    .font(.system(size: 14))
            //                            }
            //                        }
            //
            //                        Spacer()
            //
            //                        Button(action: {
            //
            //                        }) {
            //                            VStack {
            //                                Image(systemName: "shippingbox.fill")
            //                                    .foregroundColor(.red)
            //                                    .font(.system(size: 24))
            //                                    .padding()
            //                                Text("Orders")
            //                                    .foregroundColor(.red)
            //                                    .font(.system(size: 14))
            //                            }
            //                        }
            //
            //                        Spacer()
            //
            //                        Button(action: {
            //
            //                        }) {
            //                            VStack {
            //                                Image(systemName: "person.fill")
            //                                    .foregroundColor(.green)
            //                                    .font(.system(size: 24))
            //                                    .padding()
            //                                Text("Sign  Out")
            //                                    .foregroundColor(.green)
            //                                    .font(.system(size: 14))
            //                            }
            //                        }
            //
            //                        Spacer()
            //                    }
            //
            //                    .background(Color.white)
            //
            //               }
            
        }
    }
    
    
    struct TagButton: View {
        var title: String
        var action: () -> Void
        
        var body: some View {
            Button(action: action) { // Make sure to call the passed action here
                Text(title)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
}

#Preview {
    HomeView()
}
