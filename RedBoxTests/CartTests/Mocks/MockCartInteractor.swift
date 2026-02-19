import XCTest
@testable import RedBox

final class MockCartInteractor: CartInteractorProtocol {
    var isShowGetCartItemsCalled = false
    var isShowGetTotalPriceCalled = false
    var isShowRemoveItemCalled = false
    var receivedRemoveIndex: Int?
    
    private var mockItems: [CartItem] = []
    
    func setMockItems(_ items: [CartItem]) {
        mockItems = items
    }
    
    func getCartItems() -> [CartItem] {
        isShowGetCartItemsCalled = true
        return mockItems
    }
    
    func getTotalPrice() -> Int {
        isShowGetTotalPriceCalled = true
        return mockItems.reduce(0) { $0 + $1.totalPrice }
    }
    
    func removeItem(at index: Int) {
        isShowRemoveItemCalled = true
        receivedRemoveIndex = index
        mockItems.remove(at: index)
    }
}
