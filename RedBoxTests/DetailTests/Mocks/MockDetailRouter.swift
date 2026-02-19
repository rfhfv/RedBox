import XCTest
@testable import RedBox

final class MockDetailRouter: DetailRouterProtocol {
    var isNavigateBackCalled = false
    
    func navigateBack() {
        isNavigateBackCalled = true
    }
}
