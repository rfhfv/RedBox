import UIKit

final class VerticalHeaderCell: UICollectionReusableView {
    private lazy var stackView: UIStackView = {
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [recommendedLabel, spacer, viewAllLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let recommendedLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.recommendedLabel,
            font: Typography.bold.font)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.viewAllLabel,
            font: Typography.light.font, textColor: .ypLightGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension VerticalHeaderCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            recommendedLabel.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}
