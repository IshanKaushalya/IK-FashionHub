@_private(sourceFile: "CartIcon.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import SwiftUI

extension CartButton_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Components/CartIcon.swift", line: 29)
        CartButton(numberOfProducts: __designTimeInteger("#8571.[3].[0].property.[0].[0].arg[0].value", fallback: 1))
    
#sourceLocation()
    }
}

extension CartButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Components/CartIcon.swift", line: 10)
        
        ZStack(alignment: .topTrailing){
            Image(systemName: __designTimeString("#8571.[2].[1].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "cart"))
                .padding(.top, __designTimeInteger("#8571.[2].[1].property.[0].[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 5))
            
            if(numberOfProducts > 0){
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: __designTimeInteger("#8571.[2].[1].property.[0].[0].arg[1].value.[1].[0].[0].modifier[3].arg[0].value", fallback: 15), height: __designTimeInteger("#8571.[2].[1].property.[0].[0].arg[1].value.[1].[0].[0].modifier[3].arg[1].value", fallback: 15))
                    .background(.red)
                    .cornerRadius(__designTimeInteger("#8571.[2].[1].property.[0].[0].arg[1].value.[1].[0].[0].modifier[5].arg[0].value", fallback: 50))
            }
        }
    
#sourceLocation()
    }
}

import struct IKFashionHub.CartButton
import struct IKFashionHub.CartButton_Previews

