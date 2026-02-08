import UIKit

final class AppRouter: AppRouterProtocol {
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        
        let homeVC = HomeRouter.createModule()
        
        tabBar.viewControllers = [homeVC]
        tabBar.tabBar.tintColor = .systemRed
        
        return tabBar
    }
}
