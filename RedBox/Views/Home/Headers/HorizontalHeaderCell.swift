import UIKit

final class HorizontalHeaderCell: UICollectionReusableView {
    private lazy var stackView: UIStackView = {
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [sortLabel, spacer, sortImage])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.popularLabel,
            font: Typography.title.font,
            textColor: .ypBlack)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sortLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.sortLabel,
            font: Typography.light.font,
            textColor: .ypLightGray)
        return label
    }()
    
    private let sortImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .ypBlack
        image.image = UIImage(systemName: Constants.Image.sortImage)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HorizontalHeaderCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(popularLabel)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            popularLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            popularLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            sortImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
