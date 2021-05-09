import UIKit

final class PhoneInputContainer: InputContainer {
    
    lazy var textField: CodePayTextField = {
        let textField = CodePayTextField(frame: .zero)
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        
        textFieldContainerView.addSubview(textField)
        return textField
    }()
    
    override func setupContainerConstraints() {
        super.setupContainerConstraints()

        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setPlaceHolder(placeholder: String) {
        textField.placeholder = placeholder
    }
}
