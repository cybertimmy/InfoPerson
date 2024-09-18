import UIKit

final class MainView: UIView {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
