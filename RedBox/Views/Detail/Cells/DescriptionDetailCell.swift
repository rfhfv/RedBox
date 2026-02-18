import UIKit

final class DescriptionDetailCell: UITableViewCell {
    weak var delegate: DescriptionDetailCellDelegate?
    
    private lazy var mainStack: UIStackView = {
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [titleStackView, spacer, colorStackView])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [typeTitleLabel, nameTitleLabel])
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var colorStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [grayColorButton, redColorButton, blackColorButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var priceStackView: UIStackView = {
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [counterStackView, spacer, priceLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var counterStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let typeTitleLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            font: Typography.light.font,
            textColor: .ypDarkGray)
        label.text = Constants.String.headphonesLabel
        return label
    }()
    
    private let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            font: Typography.bold.font)
        return label
    }()
    
    private let grayColorButton: UIButton = {
        let button = UIButton()
        button.configureColorButton(color: .ypLightGray)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let redColorButton: UIButton = {
        let button = UIButton()
        button.configureColorButton(color: .ypRed)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let blackColorButton: UIButton = {
        let button = UIButton()
        button.configureColorButton(color: .ypBlack)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            font: Typography.light.font,
            alignment: .natural,
            textColor: .ypLightGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.configureCounterButton(text: Constants.String.minusLabel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.configureCounterButton(text: Constants.String.plusLabel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            font: Typography.smallBold.font,
            textColor: .ypDarkGray)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            font: Typography.bold.font,
            textColor: .ypDarkGray)
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.configureBlackButton(text: Constants.String.buyNowLabel)
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
    
    func configure(with product: ProductDTO, quantity: Int) {
        nameTitleLabel.text = product.title
        priceLabel.text = product.formattedPrice
        descriptionLabel.text = product.description
        countLabel.text = "\(quantity)"
    }
    
    func updatePrice(_ price: String) {
        priceLabel.text = price
    }
    
    func updateQuantity(_ quantity: Int) {
        countLabel.text = "\(quantity)"
    }
}

private extension DescriptionDetailCell {
    func setupUI() {
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    func setupActions() {
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
        [grayColorButton, redColorButton, blackColorButton].forEach {
            $0.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc func minusButtonTapped() { delegate?.cellDidTapMinus(self) }
    @objc func plusButtonTapped() { delegate?.cellDidTapPlus(self) }
    @objc func buyButtonTapped() { delegate?.cellDidTapBuy(self) }
    
    @objc func colorButtonTapped(_ sender: UIButton) {
        let colors = ["gray": grayColorButton,
                      "red": redColorButton,
                      "black": blackColorButton
        ]
        
        for (color, button) in colors {
            button.isSelected = (button == sender)
            if button == sender {
                delegate?.cellDidSelectedColor(self, color: color)
            }
        }
    }
    
    func setupViews() {
        contentView.addSubview(mainStack)
        contentView.addSubview(priceStackView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.heightAnchor.constraint(equalToConstant: 70),
            
            priceStackView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 25),
            priceStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            priceStackView.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 25),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            buyButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
