import UIKit

final class CartView: UIView {
    weak var delegate: CartViewDelegate?
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ProductCartCell.self, forCellReuseIdentifier: Constants.Cell.cartCellIdentifier)
        table.register(PaymentCartCell.self, forCellReuseIdentifier: Constants.Cell.paymentCartCellIdentifier)
        table.register(PriceCartCell.self, forCellReuseIdentifier: Constants.Cell.priceCartCellIdentifier)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let emptyStateView: UIView = {
        let view = UIView()
        view.backgroundColor = .ypWhite
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emptyImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.Image.emptyCartImage)
        image.alpha = 0.55
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let emptyTileLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.ohItIsEmptyLabel,
            font: Typography.bold.font,
            textColor: .ypDarkGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptyDetailLabel: UILabel = {
        let label = UILabel()
        label.configureStyle(
            text: Constants.String.areNoAddedProductsLabel,
            font: Typography.light.font,
            textColor: .ypDarkGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goToHomeButton: UIButton = {
        let button = UIButton()
        button.configureBlackButton(text: Constants.String.goToTheMenuLabel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTotalPrice(_ price: String) {
        let indexPath = IndexPath(row: 0, section: 2)
        if let cell = tableView.cellForRow(at: indexPath) as? PriceCartCell {
            cell.configurePrice(price)
        }
    }
    
    func updateState(isEmpty: Bool) {
        if isEmpty {
            tableView.isHidden = true
            emptyStateView.isHidden = false
        } else {
            tableView.isHidden = false
            emptyStateView.isHidden = true
        }
    }
}

private extension CartView {
    func setupUI() {
        setupViews()
        setupConstraints()
        setupGoToHomeButtonTarget()
    }
    
    func setupGoToHomeButtonTarget() {
        goToHomeButton.addTarget(self, action: #selector(tappedGoToHomeButton), for: .touchUpInside)
    }
    
    @objc func tappedGoToHomeButton() {
        delegate?.goToHomeScreen()
    }
    
    func setupViews() {
        backgroundColor = .ypWhite
        addSubview(tableView)
        addSubview(emptyStateView)
        emptyStateView.addSubview(emptyImageView)
        emptyStateView.addSubview(emptyTileLabel)
        emptyStateView.addSubview(emptyDetailLabel)
        emptyStateView.addSubview(goToHomeButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            emptyStateView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            emptyStateView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            emptyImageView.centerYAnchor.constraint(equalTo: emptyStateView.centerYAnchor, constant: -70),
            emptyImageView.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            emptyImageView.heightAnchor.constraint(equalToConstant: 100),
            
            emptyTileLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 20),
            emptyTileLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            
            emptyDetailLabel.topAnchor.constraint(equalTo: emptyTileLabel.bottomAnchor, constant: 10),
            emptyDetailLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            
            goToHomeButton.topAnchor.constraint(equalTo: emptyDetailLabel.bottomAnchor, constant: 40),
            goToHomeButton.leadingAnchor.constraint(equalTo: emptyStateView.leadingAnchor),
            goToHomeButton.trailingAnchor.constraint(equalTo: emptyStateView.trailingAnchor),
            goToHomeButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
