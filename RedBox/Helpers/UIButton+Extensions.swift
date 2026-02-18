import UIKit

extension UIButton {
    func configureBlackButton(
        text: String?,
        font: UIFont = Typography.smallBold.font,
        background: UIColor = .ypBlack,
        textColor: UIColor = .ypWhite,
        cornerRaduis: CGFloat = 15
    ) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = background
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRaduis
    }
    
    func configureCounterButton(
        text: String?,
        font: UIFont = Typography.bold.font,
        textColor: UIColor = .ypBlack,
        borderColor: UIColor = .ypBlack,
        borderWidth: CGFloat = 2,
        cornerRaduis: CGFloat = 5,
        width: CGFloat = Constants.Size.widthCounterButton
    ) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRaduis
        self.layer.borderWidth = borderWidth
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func configureColorButton(color: UIColor) {
        self.tintColor = color
        self.setImage(UIImage(systemName: Constants.Image.colorNormal), for: .normal)
        self.setImage(UIImage(systemName: Constants.Image.colorSelected), for: .selected)
    }
}
