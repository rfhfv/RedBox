import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: HomeViewProtocol {
    func showProducts(_ products: [Product]) { }
}
