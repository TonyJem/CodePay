import UIKit

enum InputViewType {
    case empty
    case phone
    case password
    
    var imageName: String {
        switch self {
        case .empty:
            return ""
        case .phone:
            return "phone"
        case .password:
            return "lock"
        }
    }
    
    var labelTitle: String {
        switch self {
        case .empty:
            return ""
        case .phone:
            return __("phone_title")
        case .password:
            return __("password_title")
        }
    }
}
