import UIKit

class MainViewController: UIViewController {
    
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

    }
}

extension MainViewController {
    
}
