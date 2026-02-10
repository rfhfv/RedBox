import UIKit

extension UILabel {
    func configureStyle(
        text: String? = nil,
        font: UIFont = Typography.regular.font,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 0,
        textColor: UIColor = .ypBlack
    ) {
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor
    }
}
