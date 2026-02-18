import UIKit

final class ProductCartCell: UITableViewCell {
    weak var delegate: ProductCartCellDelegate?
    
    private let productView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .ypLight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(font: Typography.light.font, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(font: Typography.smallBold.font, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.Image.trashFillImage), for: .normal)
        button.tintColor = .ypBlack
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
    
    func configureCell(with item: CartDisplayItem) {
        productImageView.image = UIImage(named: item.imageName)
        titleLabel.text = "\(item.title) · \(item.quantity) шт."
        priceLabel.text = item.price
    }
}

private extension ProductCartCell {
    func setupUI() {
        setupViews()
        setupConstraints()
        setupTrashButtonTarget()
    }
    
    func setupTrashButtonTarget() {
        trashButton.addTarget(self, action: #selector(trashButtonTapped), for: .touchUpInside)
    }
    
    @objc func trashButtonTapped() {
        delegate?.productCartCellDidTapTrash(self)
    }
    
    func setupViews() {
        contentView.addCustomSubviews(
            productView,
            titleLabel,
            priceLabel,
            trashButton
        )
        productView.addSubview(productImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productView.heightAnchor.constraint(equalToConstant: 80),
            productView.widthAnchor.constraint(equalToConstant: 80),
            productView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            productImageView.topAnchor.constraint(equalTo: productView.topAnchor, constant: 6),
            productImageView.centerXAnchor.constraint(equalTo: productView.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            trashButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trashButton.heightAnchor.constraint(equalToConstant: 60),
            trashButton.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: productView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: productView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trashButton.leadingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo: productView.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: trashButton.leadingAnchor, constant: -10),
        ])
    }
}
