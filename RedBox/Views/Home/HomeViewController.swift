import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView()
    var presenter: HomePresenterProtocol?
    private var products: [Product] = []
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupDelegates()
        setupNavigationItems()
    }
}

private extension HomeViewController {
    func setupDelegates() {
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
    }
    
    func setupNavigationItems() {
        let symbolConfig = UIImage.SymbolConfiguration(
            pointSize: 22,
            weight: .semibold,
            scale: .medium)
        
        let profileImage = UIImage(
            systemName: "person.fill",
            withConfiguration: symbolConfig
        )
        
        let cartImage = UIImage(
            systemName: "cart.fill",
            withConfiguration: symbolConfig
        )
        
        let profileItem = UIBarButtonItem(
            image: profileImage,
            style: .plain,
            target: nil,
            action: nil
        )
        
        let cartItem = UIBarButtonItem(
            image: cartImage,
            style: .plain,
            target: nil,
            action: nil
        )
        
        profileItem.tintColor = .ypBlack
        cartItem.tintColor = .ypBlack
        
        navigationItem.leftBarButtonItem = profileItem
        navigationItem.rightBarButtonItem = cartItem
    }
}

extension HomeViewController: HomeViewProtocol {
    func showProducts(_ products: [Product]) {
        self.products = products
        homeView.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return products.count
        } else {
            return products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.horizontalHomeCellIdentifier, for: indexPath) as? HorizontalHomeCell else { return UICollectionViewCell() }
            let product = products[indexPath.item]
            cell.configureHomeCell(image: product.image, title: product.title, price: product.price)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.verticalHomeCellIdentifier, for: indexPath) as? VerticalHomeCell else { return UICollectionViewCell() }
            let product = products[indexPath.item]
            cell.configureHomeCell(image: product.image, title: product.title, price: product.price)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        
        if indexPath.section == 0 {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Cell.horizontalHomeHeaderCellIdentifier, for: indexPath) as? HorizontalHeaderCell else { return UICollectionReusableView() }
            return header
        } else {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Cell.verticalHomeHeaderCellIdentifier, for: indexPath) as? VerticalHeaderCell else { return UICollectionReusableView() }
            return header
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let product = products[indexPath.item]
            presenter?.didTapProduct(product)
        } else {
            let product = products[indexPath.item]
            presenter?.didTapProduct(product)
        }
    }
}
