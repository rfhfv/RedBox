import UIKit

final class AppRouter: AppRouterProtocol {
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        
        let homeVC = HomeRouter.createModule()
        
        tabBar.viewControllers = [homeVC]
        tabBar.tabBar.tintColor = .ypRed
        tabBar.tabBar.barTintColor = .ypWhite
        tabBar.tabBar.shadowImage = UIImage()
        tabBar.tabBar.backgroundImage = UIImage()
        
        return tabBar
    }
}
