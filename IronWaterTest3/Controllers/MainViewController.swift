import UIKit

class MainViewController: UIViewController {
    
    private let mainView: MainView
    private let dataStorage = DataStorageManager()
    
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
        setupApperiance()
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
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
