import UIKit

class PhoneTextFieldView: UIView {
    
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
}


extension PhoneTextFieldView {
    func setupConstraints() {
        inputTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
