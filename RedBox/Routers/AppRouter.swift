import UIKit

final class AppRouter: AppRouterProtocol {
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        
        let homeVC = HomeRouter.createModule()
        let cartVC = CartRouter.createModule()
        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        
        favoriteVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: Constants.Image.favoriteTabBarIcon),
            tag: 1)
        
        settingsVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: Constants.Image.settingsTabBarIcon),
            tag: 3)
        
        tabBar.viewControllers = [homeVC, favoriteVC, cartVC, settingsVC]
        tabBar.tabBar.tintColor = .ypBlack
        tabBar.tabBar.barTintColor = .ypWhite
        tabBar.tabBar.shadowImage = UIImage()
        tabBar.tabBar.backgroundImage = UIImage()
        
        return tabBar
    }
}
