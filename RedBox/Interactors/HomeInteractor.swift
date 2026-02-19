final class HomeInteractor: HomeInteractorProtocol {
    private var products: [ProductDTO] = []
    
    func fetchProducts(completion: @escaping ([ProductDTO]) -> Void) {
        let products = HeadphoneModel.allCases.map { ProductDTO(from: $0) }
        self.products = products
        completion(products)
    }
    
    func getProductsCount() -> Int {
        return products.count
    }
    
    func getProduct(at index: Int) -> ProductDTO {
        return products[index]
    }
}
