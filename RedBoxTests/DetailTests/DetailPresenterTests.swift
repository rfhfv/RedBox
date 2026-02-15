import XCTest
@testable import RedBox

final class DetailPresenterTests: XCTestCase {
    var sut: DetailPresenter!
    var mockView: MockDetailView!
    var mockInteractor: MockDetailInteractor!
    var mockRouter: MockDetailRouter!
    let testProcuct = ProductDTO(from: .seven)
    
    override func setUp() {
        super.setUp()
        mockView = MockDetailView()
        mockInteractor = MockDetailInteractor(product: testProcuct)
        mockRouter = MockDetailRouter()
        sut = DetailPresenter(
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
    
    func testViewDidLoadDisplayProduct() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.isDisplayProcutCalled)
        XCTAssertEqual(mockView.receivedProduct?.title, testProcuct.title)
    }
    
    func testBackButtonTappedNavigationBack() {
        sut.backButtonTapped()
        XCTAssertTrue(mockRouter.isNavigateBackCalled)
    }
    
    func testPlusButtonTappedIncreaseQuantity() {
        // Ginen
        sut.viewDidLoad()
        let initialQuantity = mockInteractor.currentQuantity
        
        // When
        sut.plusButtonTapped()
        
        // Then
        XCTAssertEqual(mockInteractor.currentQuantity, initialQuantity + 1)
        XCTAssertTrue(mockView.isUpdateQuantityCalled)
        XCTAssertTrue(mockView.isUpdatePriceCalled)
    }
    
    func testMinusButtonTappedDecreasesQuantity() {
        // Given
        sut.viewDidLoad()
        _ = mockInteractor.increaseQuantity()
        let beforeMinus = mockInteractor.currentQuantity
        
        // When
        sut.minusButtonTapped()
        
        // Then
        XCTAssertEqual(mockInteractor.currentQuantity, beforeMinus - 1)
        XCTAssertTrue(mockView.isUpdateQuantityCalled)
        XCTAssertTrue(mockView.isUpdatePriceCalled)
    }
    
    func testMinusButtonTappedDoesNotGoBelowOne() {
        // Given
        sut.viewDidLoad()
        
        // When
        sut.minusButtonTapped()
        
        //Then
        XCTAssertEqual(mockInteractor.currentQuantity, 1)
    }
    
    func testColorSelectedChangescolor(_ color: String) { }
    
    func testBuyButtonTappedGoToPayScreen() { }
}
