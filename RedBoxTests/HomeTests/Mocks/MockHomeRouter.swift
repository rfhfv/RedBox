import XCTest
@testable import RedBox

final class MockHomeRouter: HomeRouterProtocol {
    var isShowDetailsCalled = false
    var receivedProduct: ProductDTO?
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func showDetails(of product: RedBox.ProductDTO) {
        isShowDetailsCalled = true
        receivedProduct = product
    }
}
