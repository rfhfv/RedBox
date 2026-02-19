import XCTest
@testable import RedBox

final class MockHomeInteractor: HomeInteractorProtocol {
    private var mockProducts: [ProductDTO] = [
        ProductDTO(from: .airpods),
        ProductDTO(from: .beats),
        ProductDTO(from: .seven)
    ]
    
    func fetchProducts(completion: @escaping ([RedBox.ProductDTO]) -> Void) {
        completion(mockProducts)
    }
    
    func getProductsCount() -> Int {
        return mockProducts.count
    }
    
    func getProduct(at index: Int) -> RedBox.ProductDTO {
        return mockProducts[index]
    }
}
