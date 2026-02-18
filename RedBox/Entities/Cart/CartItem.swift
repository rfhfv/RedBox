struct CartItem {
    let product: ProductDTO
    var quantity: Int
    var totalPrice: Int { return product.price * quantity }
    var displayPrice: String { return "$\(totalPrice)" }
    
    init(product: ProductDTO, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}
