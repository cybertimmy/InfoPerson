import UIKit

final class MainCell: UITableViewCell {
    
    static let identifer = "MainCell"
    
    private var labelsStackView: UIStackView!
        
    private let fieldName: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.numberOfLines = 0
        view.lineBreakMode = .byTruncatingTail
        return view
    }()
    
    private lazy var valueField: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .right
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .blue
        isUserInteractionEnabled = false
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        labelsStackView = UIStackView(arrangedSubviews: [fieldName,
                                                         valueField])
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .horizontal
        labelsStackView.alignment = .fill
    }
    private func setupApperiance() {
        setupStackView()
        contentView.addSubviews(labelsStackView)
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueField.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
    }
    
    func configure(_ fieldName: String, _ value: String?) {
        self.fieldName.text = fieldName
        self.valueField.text = value
        
    }
}
