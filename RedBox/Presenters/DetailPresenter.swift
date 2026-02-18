final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    let interactor: DetailInteractorProtocol
    let router: DetailRouterProtocol
    
    init(view: DetailViewProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        displayProduct()
        updatePrice()
        view?.updateQuantity(interactor.currentQuantity)
        view?.updateColor(interactor.currentColor)
    }
    
    func backButtonTapped() {
        router.navigateBack()
    }
    
    func plusButtonTapped() {
        let newQuantity = interactor.increaseQuantity()
        view?.updateQuantity(newQuantity)
        updatePrice()
    }
    
    func minusButtonTapped() {
        let newQuantity = interactor.decreaseQuantity()
        view?.updateQuantity(newQuantity)
        updatePrice()
    }
    
    func colorSelected(_ color: String) {
        let newColor = interactor.selectColor(color)
        view?.updateColor(newColor)
    }
    
    func buyButtonTapped() {
        let product = interactor.product
        let quantity = interactor.currentQuantity
        
        let cartItem = CartItem(product: product, quantity: quantity)
        CartManager.shared.addItem(cartItem)
        
        view?.showAddToCartAlert()
    }
    
    func goToCart() {
    }
}

private extension DetailPresenter {
    func displayProduct() {
        let product = interactor.product
        view?.displayProduct(product)
    }
    
    func updatePrice() {
        let totalPrice = interactor.getTotalPrice()
        view?.updatePrice("$\(totalPrice)")
    }
}
