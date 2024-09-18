import UIKit

final class ProfileViewController: UIViewController, UITableViewDelegate {
    
    var dataStorage: DataStorageManager
    var genderPicker: GenderPicker!
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, ProfileField>!
    var selectedIndexPath: IndexPath?
    var profileFields: [ProfileField] {
        get {
            dataStorage.loadItemsFromUserDefaults()
        }
        set {
            dataStorage.saveItemsToUserDefaults(newValue)
        }
    }

    init(dataStorage: DataStorageManager) {
        self.dataStorage = dataStorage
        super.init(nibName: nil, bundle: nil)
        self.genderPicker = GenderPicker(on: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func validateAndSave() {
        let validationErrors = Validator.validateFields(profileFields)
        if validationErrors.isEmpty {
            dataStorage.saveItemsToUserDefaults(profileFields)
        } else {
            AlertError.showValidationErrorAlert(on: self, with: validationErrors)
            applySnapshot()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDataSource()
        applySnapshot()
        setupNavigationBar()
    }
        
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.delegate = self
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifer)
        tableView.allowsSelectionDuringEditing = true
        view.addSubviews(tableView)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Редактировать",
            style: .plain,
            target: self,
            action: #selector(toggleEditing)
        )
    }
    
    @objc private func toggleEditing() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        tableView.visibleCells.forEach({$0.isUserInteractionEnabled = tableView.isEditing})
        navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "Готово" : "Редактировать"
        if !tableView.isEditing {
            validateAndSave()
        }
    }
    
    private func setupDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, ProfileField>(tableView: tableView) { tableView, indexPath, profileField in
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifer, for: indexPath) as! TableCell
            cell.configure(profileField.title, profileField.value)
            return cell
        }
        dataSource.defaultRowAnimation = .fade
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProfileField>()
        snapshot.appendSections([.main])
        snapshot.appendItems(profileFields)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ProfileViewController {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.isEditing else { return }
        let profileField = profileFields[indexPath.row]
        if profileField.title == "Дата рождения" {
            DatePicker.showDatePicker(on: self, profileField: profileField) { [weak self] newValue in
                self?.profileFields[indexPath.row].value = newValue
                self?.applySnapshot()
            }
        } else if profileField.title == "Пол" {
            genderPicker.showGenderPicker { selectGender in
                self.profileFields[indexPath.row].value = selectGender?.description ?? ""
                self.applySnapshot()
            }
        }
        else {
            AlertEdit.showEditAlert(on: self, profileField: profileField) { [weak self] newValue in
                self?.profileFields[indexPath.row].value = newValue
                self?.applySnapshot()
            }
        }
    }
}
