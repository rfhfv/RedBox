import UIKit

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        view.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: Constants.Image.homeTabBarIcon),
            tag: 0)
        
        return UINavigationController(rootViewController: view)
    }
    
    func showDetails(of product: ProductDTO) {
        let detailVC = DetailRouter.createModule(with: product)
        viewController?.navigationController?.present(detailVC, animated: true)
    }
}
