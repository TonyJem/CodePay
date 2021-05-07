import UIKit

class PasswordContainer: Container {
    
    lazy var textField: CodePayTextField = {
        let textField = CodePayTextField(frame: .zero)
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        textField.placeholder = "placeholder Password"
        
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
