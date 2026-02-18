import Foundation

final class CartManager {
    static let shared = CartManager()
    private init() {}
    
    private(set) var items: [CartItem] = [] {
        didSet {
            NotificationCenter.default.post(name: .cartDidUpdate, object: nil)
        }
    }
    
    var totalItems: Int {
        return items.count
    }
    
    var totalPrice: Int {
        return items.reduce(0) { $0 + $1.totalPrice }
    }
    
    func addItem(_ item: CartItem) {
        if let index = items.firstIndex(where: {
            $0.product.title == item.product.title
        }) {
            var existingItem = items[index]
            existingItem.quantity += item.quantity
            items[index] = existingItem
        } else {
            items.append(item)
        }
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func clearCart() {
        items.removeAll()
    }
}

extension Notification.Name {
    static let cartDidUpdate = Notification.Name("cartDidUpdate")
}
