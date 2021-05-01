import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Views
    lazy var personView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightBlue")
        view.layer.cornerRadius = 45
        
        self.view.addSubview(view)
        
        return view
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(named: "lightBlue")
        label.text = "Login"
        
        self.view.addSubview(label)
        
        return label
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        
        setupConstraints()
    }
}
