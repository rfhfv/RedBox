import UIKit

protocol DetailInteractorProtocol: AnyObject {
    var product: ProductDTO { get }
    var currentQuantity: Int { get }
    var currentColor: String { get }
    func increaseQuantity() -> Int
    func decreaseQuantity() -> Int
    func getTotalPrice() -> Int
    func selectColor(_ color: String) -> String
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol { get }
    var router: DetailRouterProtocol { get }
    func viewDidLoad()
    func backButtonTapped()
    func plusButtonTapped()
    func minusButtonTapped()
    func colorSelected(_ color: String)
    func buyButtonTapped()
}

protocol DetailViewProtocol: AnyObject {
    func displayProduct(_ product: ProductDTO)
    func updateQuantity(_ quantity: Int)
    func updatePrice(_ price: String)
    func updateColor(_ color: String)
}

protocol DescriptionDetailCellDelegate: AnyObject {
    func cellDidTapPlus(_ cell: DescriptionDetailCell)
    func cellDidTapMinus(_ cell: DescriptionDetailCell)
    func cellDidSelectedColor(_ cell: DescriptionDetailCell, color: String)
    func cellDidTapBuy(_ cell: DescriptionDetailCell)
}

protocol HeaderDetailCellDelegate: AnyObject {
    func cellDidTapBack(_ cell: HeaderDetailCell)
}

protocol DetailRouterProtocol: AnyObject {
    func navigateBack()
}
