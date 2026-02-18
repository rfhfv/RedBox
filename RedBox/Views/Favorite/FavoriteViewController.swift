import UIKit

final class FavoriteViewController: UIViewController {
    private lazy var favoritView = FavoriteView()
    
    override func loadView() {
        view = favoritView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Избранное"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
