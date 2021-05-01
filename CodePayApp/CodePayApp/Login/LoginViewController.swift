import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Views
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lightBlue")
        view.layer.cornerRadius = 45
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageName = "person.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageContainerView.addSubview(imageView)
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        lbl.textColor = UIColor(named: "lightBlue")
        lbl.text = "Login"
        
        self.view.addSubview(lbl)
        return lbl
    }()
    
    lazy var submitButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 30
        btn.backgroundColor = UIColor(named: "lightBlue")
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        
        setupConstraints()
    }
    
    
    @objc func submitButtonDidTap(_ sender: UIButton) {
      print("🟢 Submit button in Login Scene did Tap")
    }
}
