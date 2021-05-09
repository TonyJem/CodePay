import UIKit

final class CurrencyInputContainer: InputContainer {
    
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

extension CurrencyInputContainer {
    
}
