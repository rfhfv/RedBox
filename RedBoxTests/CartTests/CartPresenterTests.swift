import XCTest
@testable import RedBox

final class CartPresenterTests: XCTestCase {
    var sut: CartPresenter!
    var mockView: MockCartView!
    var mockInteractor: MockCartInteractor!
    var mockRouter: MockCartRouter!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockCartInteractor()
        mockView = MockCartView()
        mockRouter = MockCartRouter()
        
        sut = CartPresenter(
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
    
    func testViewDidLoadCallsUpdateView() {
        // Given
        let testItems = [CartItem(product: ProductDTO(from: .airpods), quantity: 1)]
        mockInteractor.setMockItems(testItems)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.isShowReloadDataCalles)
        XCTAssertTrue(mockView.isShowUpdateTotalPriceCalles)
    }
    
    func testGetItemsCountsResturnsCorrectCount() {
        // Given
        let testItems = [
            CartItem(product: ProductDTO(from: .airpods), quantity: 1),
            CartItem(product: ProductDTO(from: .beats), quantity: 2)
        ]
        mockInteractor.setMockItems(testItems)
        
        // When
        let count = sut.getItemsCount()
        
        // Then
        XCTAssertEqual(count, 2)
    }
    
    func testRemoveItemsCallsInteractorAndUpdatesView() {
        // Given
        let testItems = [CartItem(product: ProductDTO(from: .backbeat), quantity: 3)]
        mockInteractor.setMockItems(testItems)
        
        // When
        sut.didTapRemove(at: 0)
        
        // Then
        XCTAssertTrue(mockInteractor.isShowRemoveItemCalled)
        XCTAssertEqual(mockInteractor.receivedRemoveIndex, 0)
        XCTAssertTrue(mockView.isShowReloadDataCalles)
    }
    
    func testGoToHomeScreenCallsRouter() {
        // When
        sut.didTapGoToHomeScreen()
        
        // Then
        XCTAssertTrue(mockRouter.isShowGoToHomeScreenCalled)
    }
}
