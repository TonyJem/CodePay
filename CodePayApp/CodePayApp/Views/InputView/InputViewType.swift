import UIKit

enum InputViewType {
    case phone
    case password
    case confirmPassword
    
    var imageName: String {
        switch self {
        case .phone:
            return "phone"
        case .password:
            return "lock"
        case .confirmPassword:
            return "passwordConfirm"
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
        }
    }
    
    var container: InputContainer {
        switch self {
        case .phone:
            return PhoneInputContainer()
        case .password:
            return PasswordInputContainer()
        case .confirmPassword:
            return ConfirmPasswordInputContainer()
        }
    }
}
