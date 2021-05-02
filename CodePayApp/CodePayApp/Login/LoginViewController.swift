import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Views
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        view.layer.cornerRadius = 45
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: "person"))
        
        imageContainerView.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: __("login_heading"), dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        self.view.addSubview(lbl)
        return lbl
    }()
    
    lazy var phoneView: PhoneView = {
        let view = PhoneView()
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var passwordView: PasswordView = {
        let view = PasswordView()
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.setup(title: __("login_btn"), dto: CodePayButtonDTO.submit)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        return btn
    }()
    
    lazy var secondaryButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.setup(title: __("create_new_account_btn"), dto: CodePayButtonDTO.secondary)
        btn.addTarget(self, action: #selector(registerButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.loginSceneBackground
        
        setupConstraints()
        
        observeKeyboardNotifications()
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        print("🟢 'Submit' button in Login Scene did Tap")
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        print("🟣 'SignIn' button in Login Scene did Tap")
    }
}
