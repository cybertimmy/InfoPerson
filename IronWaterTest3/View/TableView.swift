import UIKit
  
final class TableView: UIView, UITableViewDelegate {
    
    public let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifer)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.delegate = self
    }
    
    private func setupApperiance() {
        self.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
