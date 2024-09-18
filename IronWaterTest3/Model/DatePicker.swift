import UIKit

final class DatePicker {
    
    static func showDatePicker(on viewController: UIViewController, profileField: ProfileField, completion: @escaping (String) -> Void) {
        let datePickerVC = UIViewController()
        datePickerVC.modalPresentationStyle = .popover
        let datePicker = setupDatePicker(profileField: profileField, for: datePickerVC)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateValue = dateFormatter.string(from: datePicker.date)
            completion(dateValue)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let alert = UIAlertController(title: "Выберите дату рождения", message: nil, preferredStyle: .alert)
        alert.setValue(datePickerVC, forKey: "contentViewController")
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private static func setupDatePicker(profileField: ProfileField, for viewController: UIViewController) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .wheels
        if let date = ConvertDate.convertStringToDate(profileField.value) {
            datePicker.date = date
        }
        let datePickerVC = viewController
        datePickerVC.preferredContentSize = CGSize(width: 300, height: 250)
        datePickerVC.view.addSubviews(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: datePickerVC.view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: datePickerVC.view.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: datePickerVC.view.topAnchor),
            datePicker.bottomAnchor.constraint(equalTo: datePickerVC.view.bottomAnchor)
        ])
        return datePicker
    }
}


class ConvertDate {
     static func convertStringToDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: dateString)
    }
}
