import UIKit

final class PhoneInputCell: InputCell {
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func inputType() -> InputViewType {
        return .phone
    }
}

final class PasswordInputCell: InputCell {
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func inputType() -> InputViewType {
        return .password
    }
}

final class ConfirmPasswordInputCell: InputCell {
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func inputType() -> InputViewType {
        return .confirmPassword
    }
}

final class CurrencyInputCell: InputCell {
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func inputType() -> InputViewType {
        return .currency
    }
}
