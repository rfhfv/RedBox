import UIKit

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        view.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house.fill"),
            tag: 0)
        
        return UINavigationController(rootViewController: view)
    }
    
    func showDetails(of product: Product) { }
}
