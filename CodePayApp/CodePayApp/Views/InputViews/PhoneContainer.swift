import UIKit

class Container: UIView {
    lazy var textFieldContainerView: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    
    func setupContainerConstraints() {
        textFieldContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class PhoneContainer: Container {
    
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
