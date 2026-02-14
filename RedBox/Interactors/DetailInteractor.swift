final class DetailInteractor: DetailInteractorProtocol {
    private(set) var product: ProductDTO
    private(set) var currentQuantity: Int = 1
    private(set) var currentColor: String = "gray"
    
    init(product: ProductDTO) {
        self.product = product
    }
    
    func increaseQuantity() -> Int {
        currentQuantity += 1
        return currentQuantity
    }
    
    func decreaseQuantity() -> Int {
        if currentQuantity > 1 {
            currentQuantity -= 1
        }
        return currentQuantity
    }
    
    func getTotalPrice() -> Int {
        return product.price * currentQuantity
    }
    
    func selectColor(_ color: String) -> String {
        currentColor = color
        return currentColor
    }
}
