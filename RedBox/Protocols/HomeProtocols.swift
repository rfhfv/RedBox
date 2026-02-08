import UIKit

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func showDetails(of product: Product)
}

protocol HomeInteractorProtocol: AnyObject {
    func getProducts() -> [Product]
}

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapProduct(_ product: Product)
}

protocol HomeViewProtocol: AnyObject {
    func showProducts(_ products: [Product])
}
