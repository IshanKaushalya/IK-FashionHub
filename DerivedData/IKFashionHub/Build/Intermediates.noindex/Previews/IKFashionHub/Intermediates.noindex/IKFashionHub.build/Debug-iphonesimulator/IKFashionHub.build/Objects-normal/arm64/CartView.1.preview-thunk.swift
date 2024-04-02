@_private(sourceFile: "CartView.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension CartView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/CartView.swift", line: 19)
        ZStack{
            NavigationStack{
                Spacer()
                VStack(spacing: __designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: 20)){
                    Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Cart")).bold()
                        .font(.title)
                    
                    //Spacer()
                    VStack{
                        List{
                            if userVM.authenticated {
                                if cartVM.items.isEmpty {
                                    Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].[0].[0].arg[0].value", fallback: "Your favourites is Empty!"))
                                }else {
                                    ForEach(cartVM.items){
                                        data in
                                        CartItemCard(cartDM: data, cartVM: cartVM)
                                    }
                                }
                            } else {
                                Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "Login to check your Cart!"))
                            }
                        }
                        
                    .onAppear{
                            if userVM.authenticated{
                                cartVM.fetchCartData(forEmail: userVM.username)
                            }
                        }
                        .onSubmit {
                            if userVM.authenticated{
                                cartVM.fetchCartData(forEmail: userVM.username)
                            }
                        }
                        .frame(width: __designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[0].value.[0].modifier[2].arg[0].value", fallback: 370),height: __designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[0].value.[0].modifier[2].arg[1].value", fallback: 500))
                        
                    }
                    Spacer()
                    
                    VStack{
                        Spacer()
                        HStack{
                            Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Total"))
                            Spacer()
                            Text("$ \(cartVM.total, specifier: __designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[1].arg[0].value.[2].arg[0].value.[1].value.arg[1].value", fallback: "%.2f"))")
                        }
                        HStack{
                            Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: "Discount"))
                            Spacer()
                            Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[2].arg[0].value.[2].arg[0].value", fallback: "$ 0.00"))
                        }
                        Spacer()
                        //1 Spacer()
                        HStack{
                            Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[4].arg[0].value.[0].arg[0].value", fallback: "Amount"))
                            Spacer()
                            Text("$ \(cartVM.total, specifier: __designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].arg[0].value.[4].arg[0].value.[2].arg[0].value.[1].value.arg[1].value", fallback: "%.2f"))")
                        }
                        //Text(cartVM.latestOrderId)
                    }.padding(.horizontal,__designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[3].modifier[0].arg[1].value", fallback: 20))
                    
                    Button(action :{
//                        cartVM.placeOrder(email: userVM.username, total: "\(cartVM.total)")
//                        cartVM.deleteCartItems(forEmail: userVM.username)
//                        for data in cartVM.items {
//                            cartVM.placeOrderItem(order_id: 0, item_id: data.id, size: data.size, qty: data.qty)
//                            cartVM.removeFromCart(item: data)
                        
                    }, label: {
                        HStack{
                            Text(__designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[4].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "CHECKOUT"))
                                .foregroundStyle(.white).bold()
                            Image(systemName: __designTimeString("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[4].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "arrow.forward"))
                            
                        }
                        
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - __designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[4].arg[1].value.[0].modifier[1].arg[0].value.[0]", fallback: 32),height:__designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[4].arg[1].value.[0].modifier[1].arg[1].value", fallback: 48))
                    }
                           )
                           
                    .background(Color(.systemBlue))
                    .cornerRadius(__designTimeInteger("#7447.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[4].modifier[1].arg[0].value", fallback: 50))
//                    .alert(isPresented: $cartVM.showError) {
//                        Alert(
//                            title: Text("Unable to Place the Order"),
//                            message: Text("Please try again later")
//                        )
//                    }
//                    .alert(isPresented: $cartVM.showSuccess) {
//                        Alert(
//                            title: Text("Your Order"),
//                            message: Text("Order Placed Successfully")
//                        )
//                    }
//                    
//                    Spacer()
                }
                           
                .padding(.top)
                .padding(.bottom)
                .preferredColorScheme(.light)
                Spacer()
            }
        }
//        .onTapGesture {
//            if userVM.authenticated{
//                cartVM.fetchCartData(forEmail: userVM.username)
//            }
//        }
    
#sourceLocation()
    }
}

import struct IKFashionHub.CartView
#Preview {
    CartView()
        .environmentObject(CartViewModel())
}



