import UIKit

final class VerticalHomeCell: UICollectionViewCell {
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(font: Typography.smallBold.font)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(font: Typography.light.font, textColor: .ypDarkGray)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHomeCell(image: String, title: String, price: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        priceLabel.text = price
    }
}

private extension VerticalHomeCell {
    func setupUI() {
        setupViews()
        setupContraints()
    }
    
    func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 50
        contentView.backgroundColor = .ypLight
        contentView.addSubview(stackView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28),
            
            imageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}
