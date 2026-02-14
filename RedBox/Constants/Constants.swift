import UIKit

struct Constants {
    struct Cell {
        static let horizontalHomeCellIdentifier = "HorizontalHomeCellIdentifier"
        static let verticalHomeCellIdentifier = "VerticalHomeCellIdentifier"
        static let horizontalHomeHeaderCellIdentifier = "HorizontalHomeHeaderCellIdentifier"
        static let verticalHomeHeaderCellIdentifier = "VerticalHomeHeaderCellIdentifier"
        
        static let headerDetailCellIdentifier = "HeaderDetailCell"
        static let descriptionDetailCellIdentifier = "DescriptionDetailCell"
    }
    
    struct String {
        static let searchBarPlaceholder = "Поиск..."
        static let recommendedLabel = "Рекоммендации"
        static let viewAllLabel = "Все"
        static let popularLabel = "Популярное"
        static let sortLabel = "Сортировка по цене"
        static let buyNowLabel = "Купить сейчас"
        static let headphones = "Headphones"
        static let minusLabel = "-"
        static let plusLabel = "+"
    }
    
    struct Image {
        static let homeTabBarIcon = "house.fill"
        static let sortImage = "chevron.down"
        static let backImage = "chevron.left"
        static let colorNormal = "circle.fill"
        static let colorSelected = "circle.inset.filled"
    }
    
    struct Size {
        static let heightBlackButton: CGFloat = 80
        static let widthCounterButton: CGFloat = 40
    }
}
