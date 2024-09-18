import UIKit

final class Validator {
    static func validateFields(_ fields: [ProfileField]) -> [String] {
        var errors: [String] = []
        for field in fields {
            if field.title != "Отчество" && field.value.isEmpty {
                errors.append("\(field.title) не может быть пустым")
            }
        }
        return errors
    }
}
