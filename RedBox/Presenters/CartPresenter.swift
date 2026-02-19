import Foundation

final class CartPresenter: CartPresenterProtocol {
    weak var view: CartViewProtocol?
    private let interactor: CartInteractorProtocol
    private let router: CartRouterProtocol
    
    init(view: CartViewProtocol, interactor: CartInteractorProtocol, router: CartRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(cartDidUpdate),
            name: .cartDidUpdate,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func viewDidLoad() {
        updateView()
    }
    
    func getItemsCount() -> Int {
        return interactor.getCartItems().count
    }
    
    func getItem(at index: Int) -> CartDisplayItem {
        let item = interactor.getCartItems()[index]
        return CartDisplayItem(from: item)
    }
    
    func getTotalPrice() -> String {
        return "$\(interactor.getTotalPrice())"
    }
    
    func didTapRemove(at index: Int) {
        interactor.removeItem(at: index)
        updateView()
    }
    
    private func updateView() {
        view?.reloadData()
        view?.updateTotalPrice(getTotalPrice())
    }
    
    @objc private func cartDidUpdate() {
        updateView()
    }
    
    func didTapGoToHomeScreen() {
        router.goToHomeScreen()
    }
}
