import UIKit

enum InputViewType {
    case phone
    case password
    
    var imageName: String {
        switch self {
        case .phone:
            return "phone"
        case .password:
            return "lock"
        }
    }
    
    var title: String {
        switch self {
        case .phone:
            return __("phone_title")
        case .password:
            return __("password_title")
        }
    }
    
    var placeholder: String {
        switch self {
        case .phone:
            return __("phone_placeholder")
        case .password:
            return __("password_placeholder")
        }
    }
    
    var container: TextFieldContainer {
        switch self {
        case .phone:
            return PhoneTextFieldContainer()
        case .password:
            return PasswordTextFieldContainer()
        }
    }
}
