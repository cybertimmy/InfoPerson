import UIKit

final class GenderPicker: NSObject {
    
    private var pickerView: UIPickerView
    private var completion: ((Gender?) -> Void)?
    private weak var viewController: UIViewController?
    
    init(on viewController: UIViewController) {
        self.viewController = viewController
        self.pickerView = UIPickerView()
        super.init()
        setupPickerView()
    }
    
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        viewController?.view.addSubviews(pickerView)
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: viewController!.view.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: viewController!.view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: viewController!.view.trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 216)
        ])
    }
    
    func showGenderPicker(completion: @escaping (Gender?) -> Void) {
        self.completion = completion
        pickerView.isHidden = false
    }
    
    func hideGenderPicker() {
        pickerView.isHidden = true
    }
}

extension GenderPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender(rawValue: row)?.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedGender = Gender(rawValue: row)
        completion?(selectedGender)
        hideGenderPicker()
    }
}
