import UIKit

final class FavoriteView: UIView {
    private let emptyStateView: UIView = {
        let view = UIView()
        view.backgroundColor = .ypWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emptyImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.Image.emptyStateImage)
        image.alpha = 0.55
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let emptyTileLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.tadamLabel,
            font: Typography.bold.font,
            textColor: .ypDarkGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptyDetailLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.underDevelopmentLabel,
            font: Typography.light.font,
            textColor: .ypDarkGray)
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

private extension FavoriteView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .ypWhite
        addSubview(emptyStateView)
        emptyStateView.addSubview(emptyImageView)
        emptyStateView.addSubview(emptyTileLabel)
        emptyStateView.addSubview(emptyDetailLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emptyStateView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            emptyStateView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            emptyImageView.centerYAnchor.constraint(equalTo: emptyStateView.centerYAnchor, constant: -70),
            emptyImageView.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            emptyImageView.heightAnchor.constraint(equalToConstant: 140),
            
            emptyTileLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 20),
            emptyTileLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            
            emptyDetailLabel.topAnchor.constraint(equalTo: emptyTileLabel.bottomAnchor, constant: 10),
            emptyDetailLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor)
        ])
    }
}
