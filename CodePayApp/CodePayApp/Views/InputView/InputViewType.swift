import UIKit

enum InputViewType {
    case phone
    case password
    case confirmPassword
    case currency
    
    var imageName: String {
        switch self {
        case .phone:
            return "phone"
        case .password, .confirmPassword:
            return "lock"
        case .currency:
            return "currency"
        }
    }
    
    var title: String {
        switch self {
        case .phone:
            return __("phone_title")
        case .password:
            return __("password_title")
        case .confirmPassword:
            return __("confirm_password_title")
        case .currency:
            return __("currency_title")
        }
    }
    
    var placeholder: String {
        switch self {
        case .phone:
            return __("phone_placeholder")
        case .password:
            return __("password_placeholder")
        case .confirmPassword:
            return __("confirm_password_placeholder")
        case .currency:
            return __("currency_placeholder")
        }
    }
    
    var container: TextFieldContainer {
        switch self {
        case .phone:
            return PhoneTextFieldContainer()
        case .password, .confirmPassword:
            return PasswordTextFieldContainer()
        case .currency:
            return CurrencyTextFieldContainer()
        }
    }
}
