import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Views
    lazy var personView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        self.view.addSubview(view)
        
        return view
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        setupConstraints()
    }
}
