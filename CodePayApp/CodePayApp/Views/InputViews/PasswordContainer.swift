import UIKit

class PasswordContainer: Container {
    
    lazy var textFieldContainerView: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    lazy var textField: CodePayTextField = {
        let textField = CodePayTextField(frame: .zero)
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        textField.placeholder = "placeholder Password"
        
        textFieldContainerView.addSubview(textField)
        return textField
    }()
    
    override func setupContainerConstraints() {
        textFieldContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
