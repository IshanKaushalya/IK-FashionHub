import Foundation
import SwiftUI

struct CartDataModel : Codable, Identifiable {
    var id : Int
    var prod_name : String
    var prod_price : Double
    var prod_image : String
    var size : String
    var qty : Int
}
