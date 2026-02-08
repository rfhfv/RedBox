final class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        displayProducts()
    }
    
    func didTapProduct(_ product: Product) {
        router.showDetails(of: product)
    }
    
    private func displayProducts() {
        let products = interactor.getProducts()
        view?.showProducts(products)
    }
}
