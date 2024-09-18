import UIKit

struct Item: Hashable, Identifiable, Codable {
    let id: UUID
    let firstName: String?
    let secondname: String?
    let thirdName: String?
    let birthDate: Date?
    let gender: Gender?
    let isEditingMode: Bool
}

