import UIKit

final class DetailViewController: UIViewController {
    private lazy var detailView = DetailView()
    var presenter: DetailPresenterProtocol?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        presenter?.viewDidLoad()
    }
}

private extension DetailViewController {
    func setupDelegates() {
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
    }
    
    func updateHeaderDetailCell(block: @escaping (HeaderDetailCell) -> Void) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            guard let cell = self.detailView.tableView.cellForRow(at: indexPath) as? HeaderDetailCell else { return }
            block(cell)
        }
    }
    
    func updateDescriptionDetailCell(block: @escaping (DescriptionDetailCell) -> Void) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 1, section: 0)
            guard let cell = self.detailView.tableView.cellForRow(at: indexPath) as? DescriptionDetailCell else { return }
            block(cell)
        }
    }
}

extension DetailViewController: DetailViewProtocol {
    func displayProduct(_ product: ProductDTO) {
        DispatchQueue.main.async {
            self.detailView.tableView.reloadData()
        }
    }
    
    func updateQuantity(_ quantity: Int) {
        updateDescriptionDetailCell { $0.updateQuantity(quantity) }
    }
    
    func updatePrice(_ price: String) {
        updateDescriptionDetailCell { $0.updatePrice(price) }
    }
    
    func updateColor(_ color: String) { }
}

extension DetailViewController: HeaderDetailCellDelegate {
    func cellDidTapBack(_ cell: HeaderDetailCell) {
        presenter?.backButtonTapped()
    }
}

extension DetailViewController: DescriptionDetailCellDelegate {
    func cellDidTapPlus(_ cell: DescriptionDetailCell) {
        presenter?.plusButtonTapped()
    }
    
    func cellDidTapMinus(_ cell: DescriptionDetailCell) {
        presenter?.minusButtonTapped()
    }
    
    func cellDidSelectedColor(_ cell: DescriptionDetailCell, color: String) {
        presenter?.colorSelected(color)
    }
    
    func cellDidTapBuy(_ cell: DescriptionDetailCell) {
        presenter?.buyButtonTapped()
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.headerDetailCellIdentifier, for: indexPath) as? HeaderDetailCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            if let product = presenter?.interactor.product {
                cell.configure(with: product)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.descriptionDetailCellIdentifier, for: indexPath) as? DescriptionDetailCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            if let product = presenter?.interactor.product {
                let quantity = presenter?.interactor.currentQuantity ?? 1
                cell.configure(with: product, quantity: quantity)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
