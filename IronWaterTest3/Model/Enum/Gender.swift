import UIKit

enum Gender: Int, CaseIterable, Codable {
    
    case notSpecified = 0
    case male = 1
    case female = 2

    var description: String {
        switch self {
        case .notSpecified: return "Не указан"
        case .male: return "Мужской"
        case .female: return "Женский"
        }
    }

    static func fromString(description: String) -> Gender {
        switch description {
        case "Мужской": return .male
        case "Женский": return .female
        default: return .notSpecified
        }
    }
}
