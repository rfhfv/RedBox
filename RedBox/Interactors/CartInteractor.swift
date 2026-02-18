final class CartInteractor: CartInteractorProtocol {
    func getCartItems() -> [CartItem] {
        return CartManager.shared.items
    }
    
    func getTotalPrice() -> Int {
        return CartManager.shared.totalPrice
    }
    
    func removeItem(at index: Int) {
        CartManager.shared.removeItem(at: index)
    }
}
