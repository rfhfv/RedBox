import UIKit

final class HeaderDetailCell: UITableViewCell {
    weak var delegate: HeaderDetailCellDelegate?
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.Image.backImage), for: .normal)
        button.tintColor = .ypBlack
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = 3
        control.currentPage = 0
        control.currentPageIndicatorTintColor = .ypBlack
        control.pageIndicatorTintColor = .ypLightGray
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: ProductDTO) {
        productImage.image = UIImage(named: product.imageName)
    }
}

private extension HeaderDetailCell {
    func setupUI() {
        setupViews()
        setupConstaints()
        didTapBackButton()
    }
    
    func didTapBackButton() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        delegate?.cellDidTapBack(self)
    }
    
    func setupViews() {
        contentView.addSubview(backButton)
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
        scrollView.addSubview(productImage)
    }
    
    func setupConstaints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 300),
            
            productImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            productImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 250),
            
            pageControl.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 30),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
