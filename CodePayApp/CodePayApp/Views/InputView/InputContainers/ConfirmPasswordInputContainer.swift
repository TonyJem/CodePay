import UIKit

final class ConfirmPasswordInputContainer: InputContainer {
    
    lazy var textField: CodePayTextField = {
        let textField = Core.confirmPasswordField
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        textField.isSecureTextEntry = true
        textField.tag = 2
        inputViewContainer.addSubview(textField)
        return textField
    }()
    
    lazy var visibilityButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(visibilityButtonDidTap(_:)), for: .touchUpInside)
        btn.setImage(UIImage(named: "passwordShow"), for: .normal)
        
        inputViewContainer.addSubview(btn)
        return btn
    }()
    
    @objc func visibilityButtonDidTap(_ sender: UIButton) {
        passwordIsVisible = !passwordIsVisible
    }
    
    private var passwordIsVisible = false {
        didSet {
            if passwordIsVisible {
                let image = UIImage(named: "passwordHide")
                visibilityButton.setImage(image, for: .normal)
            } else {
                let image = UIImage(named: "passwordShow")
                visibilityButton.setImage(image, for: .normal)
            }
            textField.isSecureTextEntry = !passwordIsVisible
        }
    }
    
    override func setupContainerConstraints() {
        super.setupContainerConstraints()
        
        visibilityButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.bottom.trailing.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(visibilityButton.snp.leading)
        }
    }
    
    override func setPlaceholder(placeholder: String) {
        textField.placeholder = placeholder
    }
}
