import XCTest
@testable import RedBox

final class MockCartRouter: CartRouterProtocol {
    var isShowGoToHomeScreenCalled = false
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func goToHomeScreen() {
        isShowGoToHomeScreenCalled = true
    }
}
