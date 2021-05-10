import UIKit

struct Core {
    
    static let navController = UINavigationController()
    
    static private let widthMultiplier: CGFloat = 0.7143
    static private let screenWidth = UIScreen.main.bounds.width
    static private let screenHeigh = UIScreen.main.bounds.height
    
    static var itemWidth: CGFloat {
        return screenWidth * widthMultiplier
    }
    
    static var mainContainerViewHeight: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else {
            return 340 }
        value = 318.3843 + (screenHeigh - 568) * 0.2183
        return value
    }
    
    static var mainContainerCenterOffset: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 80 }
        value = 77.0306 + (screenHeigh - 568) * 0.131
        return value
    }
    
    static var deltaMainContainerCenterOffset: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 120 }
        value = 114.0611 + (screenHeigh - 568) * 0.262
        return value
    }
    
    static var deltaMainContainerViewHeight: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 2 }
        value = 1.3537 + (screenHeigh - 568) * 0.0873
        return value
    }
    
    static var spacing: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 17 }
        value = 15.6769 + (screenHeigh - 568) * 0.0437
        return value
    }
    
    static var topBottomInset: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 5 }
        value = 1.3537 + (screenHeigh - 568) * 0.0873
        return value
    }
    
    static var noteLabelInset: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 5 }
        value = 1.3537 + (screenHeigh - 568) * 0.0873
        return value
    }
    
    static var stackViewInset: CGFloat {
        var value = CGFloat()
        guard 568 <= screenHeigh else { return 65 }
        value = 65.4148 + (screenHeigh - 568) * 0.3493
        return value
    }
}
