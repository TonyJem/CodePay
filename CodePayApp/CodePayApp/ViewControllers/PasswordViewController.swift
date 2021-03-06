import UIKit

class PasswordViewController: UIViewController {
    private let validator = PasswordValidator()
    private let passwordField = Core.passwordField
    private let confirmPasswordField = Core.confirmPasswordField
    private let imageContainerMultiplier: CGFloat = 0.2778
    private let imageResizeMultiplier: CGFloat = 0.6666
    private let mainContainerViewHeight = DimensionsUI.mainContainerViewHeight
    private let mainContainerCenterOffset = -1 * DimensionsUI.mainContainerCenterOffset
    private let titleHeight: CGFloat = 70
    private let inputViewHeight: CGFloat = 70
    private let inputViewSpace: CGFloat = -30
    private let submitButtonHeight: CGFloat = 60
    private let submitButtonBottomInset = 120
    private let secondaryButtonHeight: CGFloat = 40
    private let secondaryButtonBottomInset = 50
    
    private var imageContainerWidth: CGFloat {
        return UIScreen.main.bounds.width * imageContainerMultiplier
    }
    
    // MARK: - Views
    lazy var mainContainerView: UIView = {
        let view = UIView()
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        view.layer.cornerRadius = imageContainerWidth/2
        
        mainContainerView.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: "passwordScreen"))
        
        personImageContainer.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "Create Password", dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        mainContainerView.addSubview(lbl)
        return lbl
    }()
    
    lazy var passwordView: InputView = {
        let view = InputView(type: .password)
        
        mainContainerView.addSubview(view)
        passwordField.addTarget(self, action: #selector(passwordFieldDidChange), for: .editingChanged)
        return view
    }()
    
    lazy var confirmPasswordView: InputView = {
        let view = InputView(type: .confirmPassword)
        
        mainContainerView.addSubview(view)
        confirmPasswordField.addTarget(self, action: #selector(confirmPasswordFieldDidChange), for: .editingChanged)
        return view
    }()
    
    lazy var submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "Submit", dto: CodePayButtonDTO.submit)
        btn.isHidden = true
        
        view.addSubview(btn)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupConstraints()
        observeKeyboardNotifications()
        initializeHideKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

// MARK:  - Actions
private extension PasswordViewController {
    
    @objc func submitButtonDidTap(_ sender: UIButton) {
        guard let password = passwordView.inputContainer.contentText(),
              let confirmPassword = confirmPasswordView.inputContainer.contentText()
        else { return }
        do {
            try validator.createPassword(password: password, confirmPassword: confirmPassword)
            RegisterFlow.addCandidatePassword(password: password)
            self.navigationController?.pushViewController(CurrencyViewController(), animated: true)
        } catch {
            if let error = error as? PasswordValidator.PasswordError {
                callPasswordAlert(with: error.errorDescription)
            }
        }
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    @objc func passwordFieldDidChange(textField: CodePayTextField) {
        showSubmitButtonIfPossible()
    }
    
    @objc func confirmPasswordFieldDidChange(textField: CodePayTextField) {
        showSubmitButtonIfPossible()
    }
    
    func showSubmitButtonIfPossible() {
        guard let password = passwordField.text,
              let comfirmPassword = confirmPasswordField.text,
              password != "",
              comfirmPassword != "" else {
            submitButton.isHidden = true
            return
        }
        submitButton.isHidden = false
    }
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func callPasswordAlert(with errorMessage: String) {
        let alert = UIAlertController(title: "Password creation Error", message: errorMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK:  - Constraints
private extension PasswordViewController {
    private func setupConstraints() {
        
        mainContainerView.snp.makeConstraints { make in
            make.width.equalTo(DimensionsUI.itemWidth)
            make.height.equalTo(mainContainerViewHeight)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(mainContainerCenterOffset)
        }
        
        personImageContainer.snp.makeConstraints { make in
            make.width.height.equalTo(imageContainerWidth)
            make.top.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageResizeMultiplier)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview()
            make.height.equalTo(titleHeight)
            make.top.equalTo(personImageContainer.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        confirmPasswordView.snp.makeConstraints { make in
            make.width.bottom.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        confirmPasswordView.setupConstraints()
        
        passwordView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
            make.bottom.equalTo(confirmPasswordView.snp.top).offset(inputViewSpace)
        }
        passwordView.setupConstraints()
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(DimensionsUI.itemWidth)
            make.height.equalTo(submitButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(submitButtonBottomInset)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - LoginVC Handle Keyboard
private extension PasswordViewController {
    func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func keyboardWillAppear(_ keyboardHeight: CGFloat) {
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10 + keyboardHeight)
        }
        
        mainContainerView.snp.updateConstraints { make in
            make.height.equalTo(mainContainerViewHeight-DimensionsUI.deltaMainContainerViewHeight)
            make.centerY.equalToSuperview().offset(-1*DimensionsUI.deltaMainContainerCenterOffset)
        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    func keyboardWillDisappear() {
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(submitButtonBottomInset)
        }
        
        mainContainerView.snp.updateConstraints { make in
            make.height.equalTo(mainContainerViewHeight)
            make.centerY.equalToSuperview().offset(mainContainerCenterOffset)
        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    @objc private func keyboardWillShow(notifaction: NSNotification) {
        guard let keyboardFrame = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.keyboardWillAppear(keyboardFrame.height)
    }
    
    @objc private func keyboardWillHide() {
        keyboardWillDisappear()
    }
}
