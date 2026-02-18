import UIKit

final class AppRouter: AppRouterProtocol {
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        
        let homeVC = HomeRouter.createModule()
        let cartVC = CartRouter.createModule()
        
        tabBar.viewControllers = [homeVC, cartVC]
        tabBar.tabBar.tintColor = .ypBlack
        tabBar.tabBar.barTintColor = .ypWhite
        tabBar.tabBar.shadowImage = UIImage()
        tabBar.tabBar.backgroundImage = UIImage()
        
        return tabBar
    }
}
