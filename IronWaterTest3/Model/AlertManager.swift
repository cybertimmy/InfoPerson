import UIKit

final class AlertError {
    static func showValidationErrorAlert(on viewController: UIViewController, with messages: [String]) {
          let alert = UIAlertController(title: "Ошибка", message: messages.joined(separator: "\n"), preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
          viewController.present(alert, animated: true, completion: nil)
      }
}

final class AlertEdit {
    static func showEditAlert(on viewController: UIViewController, profileField: ProfileField, completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Редактировать \(profileField.title)", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = profileField.value
        }
        alert.addAction(UIAlertAction(title: "Сохранить", style: .default, handler: { _ in
            guard let newValue = alert.textFields?.first?.text else { return }
            completion(newValue)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
