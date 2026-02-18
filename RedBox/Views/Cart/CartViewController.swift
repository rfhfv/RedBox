import UIKit

final class CartViewController: UIViewController {
    private lazy var cartView = CartView()
    var presenter: CartPresenterProtocol?
    
    override func loadView() {
        view = cartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        presenter?.viewDidLoad()
    }
    
    private func setupDelegates() {
        cartView.tableView.dataSource = self
        cartView.tableView.delegate = self
        cartView.delegate = self
    }
}

extension CartViewController: CartViewProtocol {
    func reloadData() {
        let isEmpty = (presenter?.getItemsCount() ?? 0) == 0
        cartView.updateState(isEmpty: isEmpty)
        cartView.tableView.reloadData()
    }
    
    func updateTotalPrice(_ price: String) {
        cartView.updateTotalPrice(price)
    }
}

extension CartViewController: ProductCartCellDelegate {
    func productCartCellDidTapTrash(_ cell: ProductCartCell) {
        guard let indexPath = cartView.tableView.indexPath(for: cell) else { return }
        presenter?.didTapRemove(at: indexPath.row)
    }
}

extension CartViewController: CartViewDelegate {
    func goToHomeScreen() {
        presenter?.didTapGoToHomeScreen()
    }
}

extension CartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter?.getItemsCount() ?? 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.cartCellIdentifier, for: indexPath) as? ProductCartCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            if let item = presenter?.getItem(at: indexPath.row) {
                cell.configureCell(with: item)
                return cell
            }
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.paymentCartCellIdentifier, for: indexPath) as? PaymentCartCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.priceCartCellIdentifier, for: indexPath) as? PriceCartCell else { return UITableViewCell() }
            
            let totalPrice = presenter?.getTotalPrice() ?? "$0"
            cell.configurePrice(totalPrice)
            return cell
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CartHeaderView()
        
        switch section {
        case 0:
            header.configure(title: Constants.String.cartTitleLabel)
        case 1:
            header.configure(title: Constants.String.paymentMethodsLabel)
        default:
            return nil
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
