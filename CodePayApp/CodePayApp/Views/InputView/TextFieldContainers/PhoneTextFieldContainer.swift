import UIKit

final class PhoneTextFieldContainer: TextFieldContainer {
    
    lazy var textField: CodePayTextField = {
        let textField = CodePayTextField(frame: .zero)
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        textField.placeholder = "placeholder Phone"
        
        textFieldContainerView.addSubview(textField)
        return textField
    }()
    
    override func setupContainerConstraints() {
        super.setupContainerConstraints()

        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
