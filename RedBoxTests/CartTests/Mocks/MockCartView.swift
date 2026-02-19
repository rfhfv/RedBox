import XCTest
@testable import RedBox

final class MockCartView: CartViewProtocol {
    var isShowReloadDataCalles = false
    var isShowUpdateTotalPriceCalles = false
    var receivedPrice: String?
    
    func reloadData() {
        isShowReloadDataCalles = true
    }
    
    func updateTotalPrice(_ price: String) {
        isShowUpdateTotalPriceCalles = true
        receivedPrice = price
    }
}
