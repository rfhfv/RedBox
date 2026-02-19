import UIKit

final class PriceCartCell: UITableViewCell {
    private let totalPriceTextLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(text: Constants.String.totalPriceText,font: Typography.light.font, alignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(font: Typography.bold.font, alignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkOutButton: UIButton = {
        let button = UIButton()
        button.configureBlackButton(text: Constants.String.checkOutButtonLabel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePrice(_ price: String) {
        totalPriceLabel.text = price
    }
}

private extension PriceCartCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .ypWhite
        contentView.addCustomSubviews(totalPriceTextLabel, totalPriceLabel, checkOutButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            totalPriceTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            totalPriceTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalPriceTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            totalPriceLabel.topAnchor.constraint(equalTo: totalPriceTextLabel.bottomAnchor, constant: 10),
            totalPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            checkOutButton.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: 70),
            checkOutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            checkOutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            checkOutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            checkOutButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
}
