import XCTest
@testable import RedBox

final class MockHomeView: HomeViewProtocol {
    var isShowProductsCalled = false
    var receiveProducts: [ProductDTO]?
    
    func showProducts(_ products: [RedBox.ProductDTO]) {
        isShowProductsCalled = true
        receiveProducts = products
    }
}
