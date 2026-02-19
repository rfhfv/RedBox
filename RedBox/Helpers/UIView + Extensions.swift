import UIKit

extension UIView {
    func addCustomSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
