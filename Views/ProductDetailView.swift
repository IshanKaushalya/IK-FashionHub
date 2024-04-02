//
//  ProductDetailView.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import SwiftUI

struct ProductDetailView: View {
    @State var getSelection : String = ""
    @StateObject var productVM = ClothViewModel()
    @State private var showAlert = false
    @State private var selectedSize: String? = nil
    @State private var quantity: Int = 1 
    var userID: String
    
    var clothingDM : ClothDataModel
    
    var body: some View {
        NavigationView{
            VStack {
                if let imageURL = URL(string: clothingDM.image),
                   let imageData = try? Data(contentsOf: imageURL),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } else {
                    // Placeholder image or error handling
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                }
                
                Text(clothingDM.productName)
                    .font(.title)
                HStack{
                    Text("Description: \(clothingDM.productDescription)")
                        .font(.body)
                }
                .background(Color.gray)
                .padding(15)
                
                Text("\(clothingDM.price, specifier: "%.2f")LKR")
                    .font(.headline)
                
                HStack{
                    Spacer()
                    Button(action: {
                        getSelection = "Small"
                    }, label: {
                        Rectangle()
                            
                            .frame(width: 80, height: 40)
                            .foregroundStyle(getSelection == "Small" ? Color.gray : Color.black)
                            .overlay {
                                Text("Small")
                            }
                    })
                    Button(action: {
                        getSelection = "Medium"
                    }, label: {
                        Rectangle()
                            .frame(width: 80, height: 40)
                            .foregroundStyle(getSelection == "Medium" ? Color.gray : Color.black)
                            .overlay {
                                Text("Medium")
                            }
                    })
                    Button(action: {
                        getSelection = "Large"
                    }, label: {
                        Rectangle()
                            
                            .frame(width: 80, height: 40)
                            .foregroundStyle(getSelection == "Large" ? Color.gray : Color.black)
                            .overlay {
                                Text("Large")
                            }
                    })
                    Button(action: {
                        getSelection = "XL"
                    }, label: {
                        Rectangle()
                            .frame(width: 80, height: 40)
                            .foregroundStyle(getSelection == "XL" ? Color.gray : Color.black)
                            .overlay {
                                Text("XL")
                            }
                    })
                    
                    
                }
                Spacer()

                HStack{
                Stepper(value: $quantity, in: 1...10) {
                    Text("\(quantity)")
                        .font(.system(size: 13))
                }
            }
                if($productVM.showSuccess){
                    Text("Added to cart")
                        .font(.system(size: 12))
                        .foregroundStyle(.green)
                }
                
                if(productVM.showError){
                    Text("Unable to Add select color or quantity")
                        .font(.system(size: 12))
                        .foregroundStyle(.red)
                }
                
                Button(action:{
                    if userID.isEmpty || userID == "" {
                        showAlert = true
                    } else {
                        productVM.addToCart(itemID: "\(clothingDM.id)", userID: userID, size: getSelection, qty: "\(quantity)")
                        showAlert = false
                    }
                },label: {
                    HStack{
                        Text("ADD TO CART")
                            .foregroundStyle(.white).bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,height:48)
                })
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Unable to Add to Cart"),
                        message: Text("Make sure to login before add Favourites")
                    )
                }
                .background(Color(.systemBlue))
                .cornerRadius(50)
                .padding(.top,24)
                Spacer()

                }
            }
        .padding()
        .navigationTitle("Product Detail").bold()
        }
    }

