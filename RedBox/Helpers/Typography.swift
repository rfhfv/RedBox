import UIKit

enum Typography {
    case title
    case bold
    case smallBold
    case regular
    case light
    
    var font: UIFont {
        switch self {
        case .title: return UIFont.systemFont(ofSize: 36, weight: .heavy)
        case .bold: return UIFont.systemFont(ofSize: 26, weight: .heavy)
        case .smallBold: return UIFont.systemFont(ofSize: 20, weight: .heavy)
        case .regular: return UIFont.systemFont(ofSize: 20, weight: .regular)
        case .light: return UIFont.systemFont(ofSize: 16, weight: .light)
        }
    }
}
