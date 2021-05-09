import UIKit

final class PhoneInputContainer: InputContainer {
    
    private var buttonTitle = ""
    
    lazy var phoneButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.addTarget(self, action: #selector(phoneButtonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: buttonTitle, dto: CodePayButtonDTO.secondary)
        
        inputViewContainer.addSubview(btn)
        return btn
    }()
    
    @objc func phoneButtonDidTap(_ sender: UIButton) {
        print("🟢 phoneButton DidTap")
    }
    
    override func setupContainerConstraints() {
        super.setupContainerConstraints()

        phoneButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setPlaceholder(placeholder: String) {
        buttonTitle = placeholder
    }
}
