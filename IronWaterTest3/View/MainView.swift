import UIKit

final class MainView: UIView {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifer)
        tableView.allowsSelectionDuringEditing = true
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupAppereance() {
        self.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension MainView:  UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifer, for: indexPath) as? MainCell else {
            fatalError()
        }
        cell.textLabel?.text = "Hello"
        return cell
    }
}
    
