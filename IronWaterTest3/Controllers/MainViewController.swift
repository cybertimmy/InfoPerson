import UIKit

class MainViewController: UIViewController, ProfileVCDelegate {
    
    private let dataStorage = DataStorageManager()
    private let mainView: MainView
    
    init() {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        setupApperiance()
    }
    
    private func loadItems() {
        mainView.profileFields = dataStorage.loadItemsFromUserDefaults()
    }
    
    private func setupApperiance() {
        navigationItem.title = "Информация"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Посмотреть",
            style: .plain,
            target: self,
            action: #selector(goToTableViewController)
        )
    }
}

extension MainViewController {
    @objc private func goToTableViewController() {
        let profileVC = ProfileViewController(dataStorage: dataStorage)
        profileVC.delegate = self
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func didUpdateProf(_ update: [ProfileField]) {
        mainView.profileFields = update
        mainView.tableView.reloadData()
    }
}
