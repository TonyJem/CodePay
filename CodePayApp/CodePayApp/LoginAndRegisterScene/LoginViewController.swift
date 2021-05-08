import UIKit

class LoginViewController: UIViewController {
    
    var viewWidth: CGFloat {
        return view.frame.size.width
    }
    
    var contentWidth: CGFloat {
        return viewWidth * 0.7143
    }

    private var sceneTitle = "" {
        didSet {
            titleLabel.setup(title: sceneTitle, dto: CodePayLabelDTO.heading)
        }
    }
    
    private var submitButtonTitle = "" {
        didSet {
            submitButton.setup(title: submitButtonTitle, dto: CodePayButtonDTO.submit)
        }
    }
    
    private var secondaryButtonTitle = "" {
        didSet {
            secondaryButton.setup(title: secondaryButtonTitle, dto: CodePayButtonDTO.secondary)
        }
    }
    
    private var onLogin: Bool = true {
        didSet {
            confirmPasswordView.isHidden = onLogin
            currencyView.isHidden = onLogin
            sceneTitle = onLogin ? __("login_heading") : __("register_heading")
            submitButtonTitle = onLogin ? __("login_submit_btn") : __("create_account_submit_btn")
            secondaryButtonTitle = onLogin ? __("create_account_secondary_btn") : __("login_secondary_btn")
        }
    }
    
    // MARK: - Views
    lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .systemGray5
        scroll.contentSize = CGSize(width: contentWidth, height: 650)
        
        self.view.addSubview(scroll)
        return scroll
    }()
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        view.layer.cornerRadius = 45
        
        mainScrollView.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: "person"))
        
        imageContainerView.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.textAlignment = .center
        
        mainScrollView.addSubview(lbl)
        return lbl
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneView, passwordView, confirmPasswordView, currencyView])
        stackView.axis = .vertical
        
        mainScrollView.addSubview(stackView)
        return stackView
    }()
    
    lazy var phoneView: InputView = {
        let view = InputView()
        view.type = .phone
        return view
    }()
    
    lazy var passwordView: InputView = {
        let view = InputView()
        view.type = .password
        return view
    }()
    
    lazy var confirmPasswordView: InputView = {
        let view = InputView()
        view.type = .confirmPassword
        return view
    }()
    
    lazy var currencyView: InputView = {
        let view = InputView()
        view.type = .currency
        return view
    }()
    
    lazy var submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        return btn
    }()
    
    lazy var secondaryButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.addTarget(self, action: #selector(secondaryButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.loginSceneBackground
        
        setupConstraints()
        observeKeyboardNotifications()
        initializeHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        onLogin = true
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        print("🟢 'Submit' button in Login Scene did Tap")
    }
    
    @objc func secondaryButtonDidTap(_ sender: UIButton) {
        onLogin = !onLogin
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
}
