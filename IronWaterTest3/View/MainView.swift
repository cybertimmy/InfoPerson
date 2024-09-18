import UIKit

final class MainView: UIView {
    
    public var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifer)
        return tableView
    }()
    
    public var profileFields: [ProfileField] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupApperiance() {
        self.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifer, for: indexPath) as? MainCell else {
            fatalError()
        }
        let profileField = profileFields[indexPath.row]
        cell.configure(profileField.title, profileField.value)
        return cell
    }
}
