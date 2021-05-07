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
    
    var container: Container {
        switch self {
        case .phone:
            return PhoneContainer()
        case .password:
            return PasswordContainer()
        }
    }
}
