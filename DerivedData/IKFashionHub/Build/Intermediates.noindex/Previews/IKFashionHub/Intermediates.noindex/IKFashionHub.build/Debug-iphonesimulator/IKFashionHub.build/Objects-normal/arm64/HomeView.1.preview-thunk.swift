@_private(sourceFile: "HomeView.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension HomeView.TagButton {
typealias TagButton = HomeView.TagButton

    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/HomeView.swift", line: 265)
            Button(action: action) { // Make sure to call the passed action here
                Text(title)
                    .padding(.horizontal, __designTimeInteger("#4581.[1].[9].[2].property.[0].[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 10))
                    .padding(.vertical, __designTimeInteger("#4581.[1].[9].[2].property.[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 5))
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(__designTimeInteger("#4581.[1].[9].[2].property.[0].[0].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
            }
        
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/HomeView.swift", line: 28)
        NavigationStack{
            
            Text(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "IKFashionHub")).font(.title).foregroundColor(Color.blue).padding(__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 10))
                .bold()
            
            HStack{//the welcome note and the cart icon
                
                
                RoundedRectangle(cornerRadius: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: 0))
                    .frame(width: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 330),height: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[1].value", fallback: 40))
                    .padding(.horizontal,__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[1].value", fallback: 10))
                    .opacity(__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value", fallback: 0))
                    .overlay{
                        HStack{
                            HStack{
                                VStack{
                                    
                                    Text(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Hello Welcome!")).font(.custom(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "SF Armenian"),size: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 15)))
                                    if userVM.authenticated {
                                        Text(userVM.username).bold()
                                    } else {
                                        Text(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[1].[0].arg[0].value", fallback: "The IKFashionHub")).bold()
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
                                Image(systemName: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "person.circle"))
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
                        TextField(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Search products"), text: $searchText)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 10))
                            .padding(.horizontal)
                            .onChange(of: searchText, perform: { value in
                                
                                productVM.fetchData(forQuery: searchText)
                            })
                        
                        
                        HStack{
                            HStack {
                                Button(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Men")) {
                                    productVM.fetchData(forCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Men"))
                                    showMenOptions.toggle()
                                    showWomenOptions = __designTimeBoolean("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[1].value.[2].[0]", fallback: false)
                                }
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 10))
                                
                                
                                Button(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "Women")) {
                                    productVM.fetchData(forCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Women"))
                                    showWomenOptions.toggle()
                                    showMenOptions = __designTimeBoolean("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[1].value.[2].[0]", fallback: false)
                                }
                                .padding()
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(__designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: 10))
                            }
                            VStack {
                                Spacer()
                                Button(action: {
                                    isSortingDescending.toggle()
                                    productVM.fetchSortedData(order: isSortingDescending ? __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].modifier[0].arg[0].value.then", fallback: "desc") : __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].modifier[0].arg[0].value.else", fallback: "asc"))
                                }) {
                                    VStack {
                                        Image(systemName: isSortingDescending ? __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].arg[0].value.then", fallback: "arrow.down") : __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].arg[0].value.else", fallback: "arrow.up"))
                                            .foregroundColor(.black)
                                            .font(.system(size: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: 24)))
                                            .padding()
                                        Text(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "Sort"))
                                            .foregroundColor(.black)
                                            .font(.system(size: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value.arg[0].value", fallback: 12)))
                                    }
                                }
                            }
                            .padding(.leading, __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[0].arg[1].value", fallback: 150))
                            
                        }
                        
                        
                        if showMenOptions {
                            HStack {
                                TagButton(title: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[0].arg[0].value", fallback: "Tops"), action: {
                                    productVM.fetchData(forSubcategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Tops"), inCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: "Men"))
                                })
                                TagButton(title: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[1].arg[0].value", fallback: "Bottoms"), action: {
                                    productVM.fetchData(forSubcategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Bottoms"), inCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[1].value", fallback: "Men"))
                                })
                                
                            }
                        }
                        
                        if showWomenOptions {
                            HStack {
                                TagButton(title: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[0].arg[0].value", fallback: "Party wear"), action: {
                                    productVM.fetchData(forSubcategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Party wear"), inCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: "Women"))
                                })
                                TagButton(title: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[1].arg[0].value", fallback: "Office wear"), action: {
                                    productVM.fetchData(forSubcategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value", fallback: "Office wear"), inCategory: __designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[1].value", fallback: "Women"))
                                })
                                
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: __designTimeInteger("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].arg[1].value", fallback: 20)) {
                            ForEach(productVM.clothingDM) { productData in
                                ClothingIcon(clothingDM: productData, userVM: userVM)
                            }.padding()
                            
                        }.navigationTitle(Text(__designTimeString("#4581.[1].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].modifier[0].arg[0].value.arg[0].value", fallback: "")))
                        
                        
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
    
#sourceLocation()
    }
}

import struct IKFashionHub.HomeView
#Preview {
    HomeView()
}



