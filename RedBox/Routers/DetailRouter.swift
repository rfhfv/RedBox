import UIKit

final class DetailRouter: DetailRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(with product: ProductDTO) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor(product: product)
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func navigateBack() {
        viewController?.dismiss(animated: true)
    }
}
