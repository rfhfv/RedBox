import UIKit

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func showDetails(of product: ProductDTO)
}

protocol HomeInteractorProtocol: AnyObject {
    func fetchProducts(completion: @escaping ([ProductDTO]) -> Void)
    func getProductsCount() -> Int
    func getProduct(at index: Int) -> ProductDTO
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol { get }
    var router: HomeRouterProtocol { get }
    func viewDidLoad()
    func didTapProduct(at index: Int)
    func getProductsCount() -> Int
    func getProduct(at index: Int) -> ProductDTO?
}

protocol HomeViewProtocol: AnyObject {
    func showProducts(_ products: [ProductDTO])
}
