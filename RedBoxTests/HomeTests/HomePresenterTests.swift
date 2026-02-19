import XCTest
@testable import RedBox

final class HomePresenterTests: XCTestCase {
    var sut: HomePresenter!
    var mockInteractor: MockHomeInteractor!
    var mockView: MockHomeView!
    var mockRouter: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockHomeInteractor()
        mockView = MockHomeView()
        mockRouter = MockHomeRouter()
        
        sut = HomePresenter(
            view: mockView,
            interactor: mockInteractor,
            router: mockRouter
        )
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockView = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testViewDidLoadCallsShowProducts() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.isShowProductsCalled)
    }
    
    func testDidTapProductCallsShowDetals() {
        // Given
        let index = 0
        
        // When
        sut.didTapProduct(at: index)
        
        // Then
        XCTAssertTrue(mockRouter.isShowDetailsCalled)
        XCTAssertNotNil(mockRouter.receivedProduct)
    }
    
    func testGetProductsCountReturnCorrectCount() {
        // Given
        let expectetedCount = 3
        
        // When
        let count = sut.getProductsCount()
        
        // Then
        XCTAssertEqual(count, expectetedCount)
    }
}
