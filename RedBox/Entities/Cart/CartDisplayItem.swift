struct CartDisplayItem {
    let title: String
    let imageName: String
    let price: String
    let quantity: Int
    
    init(from item: CartItem) {
        self.title = item.product.title
        self.imageName = item.product.imageName
        self.price = item.displayPrice
        self.quantity = item.quantity
    }
}
