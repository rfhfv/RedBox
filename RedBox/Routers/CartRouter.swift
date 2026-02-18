import UIKit

final class CartRouter: CartRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = CartViewController()
        let interactor = CartInteractor()
        let router = CartRouter()
        let presenter = CartPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        
        view.presenter = presenter
        router.viewController = view
        
        view.navigationItem.title = Constants.String.cartVCTitleLabel
        view.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: Constants.Image.cartTabBarIcon),
            tag: 2
        )
        
        return UINavigationController(rootViewController: view)
    }
    
    func goToHomeScreen() {
        viewController?.tabBarController?.selectedIndex = 0
    }
}
