import UIKit

final class PaymentCartCell: UITableViewCell {
    private let paymentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .ypBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paymentImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.Image.mastercardImage)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameCardTitle: UILabel = {
        let label = UILabel()
        label.configureStyle(text: Constants.String.travelCardTextLabel,font: Typography.smallBold.font)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cartDetailsTitle: UILabel = {
        let label = UILabel()
        label.configureStyle(text: Constants.String.masterCardDetailLabel,font: Typography.light.font, textColor: .ypDarkGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let anotherCardsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.Image.viewAnotherImage), for: .normal)
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
}

private extension PaymentCartCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addCustomSubviews(
            paymentView,
            nameCardTitle,
            cartDetailsTitle,
            anotherCardsButton
        )
        paymentView.addSubview(paymentImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            paymentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            paymentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            paymentView.heightAnchor.constraint(equalToConstant: 45),
            paymentView.widthAnchor.constraint(equalToConstant: 75),
            
            paymentImageView.centerYAnchor.constraint(equalTo: paymentView.centerYAnchor),
            paymentImageView.centerXAnchor.constraint(equalTo: paymentView.centerXAnchor),
            paymentImageView.heightAnchor.constraint(equalToConstant: 25),
            
            nameCardTitle.topAnchor.constraint(equalTo: paymentView.topAnchor),
            nameCardTitle.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 10),
            nameCardTitle.trailingAnchor.constraint(equalTo: anotherCardsButton.leadingAnchor, constant: -10),
            
            cartDetailsTitle.topAnchor.constraint(equalTo: nameCardTitle.bottomAnchor, constant: 4),
            cartDetailsTitle.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 10),
            cartDetailsTitle.trailingAnchor.constraint(equalTo: anotherCardsButton.leadingAnchor, constant: -10),
            cartDetailsTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            anotherCardsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            anotherCardsButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            anotherCardsButton.heightAnchor.constraint(equalToConstant: 60),
            anotherCardsButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
