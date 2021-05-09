import UIKit

final class CurrencyTextFieldContainer: TextFieldContainer {
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        textFieldContainerView.addSubview(picker)
        return picker
    }()
    
    override func setupContainerConstraints() {
        super.setupContainerConstraints()

        pickerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CurrencyTextFieldContainer {
    
}
