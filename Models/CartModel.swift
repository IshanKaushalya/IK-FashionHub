import Foundation
import SwiftUI

struct CartDataModel : Codable, Identifiable {
    var id : Int
    var productName : String
    var price : Double
    var image : String
    var size : String
    var qty : Int
}
