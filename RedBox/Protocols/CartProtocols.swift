import UIKit

protocol CartRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func goToHomeScreen()
}

protocol CartInteractorProtocol: AnyObject {
    func getCartItems() -> [CartItem]
    func getTotalPrice() -> Int
    func removeItem(at index: Int)
}

protocol CartPresenterProtocol: AnyObject {
    var view: CartViewProtocol? { get set }
    func viewDidLoad()
    func getItemsCount() -> Int
    func getItem(at index: Int) -> CartDisplayItem
    func getTotalPrice() -> String
    func didTapRemove(at index: Int)
    func didTapGoToHomeScreen()
}

protocol CartViewProtocol: AnyObject {
    func reloadData()
    func updateTotalPrice(_ price: String)
}

protocol ProductCartCellDelegate: AnyObject {
    func productCartCellDidTapTrash(_ cell: ProductCartCell)
}

protocol CartViewDelegate: AnyObject {
    func goToHomeScreen()
}
