import UIKit

struct Constants {
    struct Cell {
        static let horizontalHomeCellIdentifier = "HorizontalHomeCellIdentifier"
        static let verticalHomeCellIdentifier = "VerticalHomeCellIdentifier"
        static let horizontalHomeHeaderCellIdentifier = "HorizontalHomeHeaderCellIdentifier"
        static let verticalHomeHeaderCellIdentifier = "VerticalHomeHeaderCellIdentifier"
        static let cartCellIdentifier = "CartCellIdentifier"
        
        static let headerDetailCellIdentifier = "HeaderDetailCell"
        static let descriptionDetailCellIdentifier = "DescriptionDetailCell"
        static let paymentCartCellIdentifier = "PaymentCartCell"
        static let priceCartCellIdentifier = "PriceCartCell"
    }
    
    struct String {
        static let searchBarPlaceholder = "Поиск..."
        static let totalPriceText = "Итог к оплате"
        static let checkOutButtonLabel = "Перейти к оплате"
        static let recommendedLabel = "Рекоммендации"
        static let viewAllLabel = "Все"
        static let popularLabel = "Популярное"
        static let sortLabel = "Сортировка по цене"
        static let buyNowLabel = "Купить сейчас"
        static let headphonesLabel = "Headphones"
        static let minusLabel = "-"
        static let plusLabel = "+"
        static let cartTitleLabel = "Корзина"
        static let paymentMethodsLabel = "Способ оплаты"
        static let travelCardTextLabel = "Travel Card"
        static let masterCardDetailLabel = "Mastercard · 3356"
        static let cartVCTitleLabel = "Мои заказы"
        static let ohItIsEmptyLabel = "Ой, пусто!"
        static let tadamLabel = "Та-дам!"
        static let areNoAddedProductsLabel = "Пока что нет добавленных товаров"
        static let underDevelopmentLabel = "Пока что находится в разработке"
        static let goToTheMenuLabel = "Перейти в меню"
    }
    
    struct Alert {
        static let notification = "Уведомление"
        static let productSuccessfullyAddedToCart = "Товар успешно добавлен в корзину"
        static let ok = "Ок"
        static let goToCart = "Перейти в корзину"
    }
    
    struct Image {
        static let homeTabBarIcon = "house.fill"
        static let cartTabBarIcon = "cart.fill"
        static let favoriteTabBarIcon = "suit.heart.fill"
        static let settingsTabBarIcon = "square.grid.2x2.fill"
        static let sortImage = "chevron.down"
        static let backImage = "chevron.left"
        static let colorNormal = "circle.fill"
        static let colorSelected = "circle.inset.filled"
        static let viewAnotherImage = "chevron.forward"
        static let trashFillImage = "trash.fill"
        static let mastercardImage = "Mastercard"
        static let emptyCartImage = "EmptyCart"
        static let emptyStateImage = "EmptyState"
    }
    
    struct Size {
        static let widthCounterButton: CGFloat = 40
    }
}
