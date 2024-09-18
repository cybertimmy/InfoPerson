import UIKit

struct ProfileField: Hashable, Codable {
    var id = UUID()
    var title: String
    var value: String
}
