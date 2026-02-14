final class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        displayProducts()
    }
    
    func didTapProduct(at index: Int) {
        let product = interactor.getProduct(at: index)
        router.showDetails(of: product)
    }
    
    func getProductsCount() -> Int {
        return interactor.getProductsCount()
    }
    
    func getProduct(at index: Int) -> ProductDTO? {
        return interactor.getProduct(at: index)
    }
}

private extension HomePresenter {
    func displayProducts() {
        interactor.fetchProducts { [weak self] products in
            self?.view?.showProducts(products)
        }
    }
}
