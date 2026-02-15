import XCTest
@testable import RedBox

final class MockDetailView: DetailViewProtocol {
    var isDisplayProcutCalled = false
    var isUpdateQuantityCalled = false
    var isUpdatePriceCalled = false
    var isUpdateColorCalled = false
    
    var receivedProduct: ProductDTO?
    var receivedQuantity: Int?
    var receivedPrice: String?
    var receivedColor: String?
    
    func displayProduct(_ product: ProductDTO) {
        isDisplayProcutCalled = true
        receivedProduct = product
    }
    
    func updateQuantity(_ quantity: Int) {
        isUpdateQuantityCalled = true
        receivedQuantity = quantity
    }
    
    func updatePrice(_ price: String) {
        isUpdatePriceCalled = true
        receivedPrice = price
    }
    
    func updateColor(_ color: String) {
        isUpdateColorCalled = true
        receivedColor = color
    }
}
