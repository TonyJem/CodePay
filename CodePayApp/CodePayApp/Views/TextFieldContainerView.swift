import UIKit

class TextFieldContainerView: UIView {
    
    var imageName = ""
    var placeholderText = ""
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textField.textColor = Colors.lightBlue
        textField.placeholder = placeholderText
        
        self.addSubview(textField)
        return textField
    }()
    
    lazy var visibilityButton: UIButton = {
        let btn = UIButton(type: .custom)
        let image = UIImage(named: imageName)
        btn.addTarget(self, action: #selector(visibilityButtonDidTap(_:)), for: .touchUpInside)
        btn.setImage(image, for: .normal)
        
        self.addSubview(btn)
        return btn
    }()
    
    lazy var customStackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 0.0
        
        stackView.addArrangedSubview(inputTextField)
        stackView.addArrangedSubview(visibilityButton)
        
        self.addSubview(stackView)
        return stackView
    }()
    
    @objc func visibilityButtonDidTap(_ sender: UIButton) {
        print("🟢👁‍🗨🟢 'visibilityButtonDidTap' button in Login Scene did Tap")
    }
}

extension TextFieldContainerView {
    func setupConstraints() {
        visibilityButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.height.equalTo(35)
        }
        
        customStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
