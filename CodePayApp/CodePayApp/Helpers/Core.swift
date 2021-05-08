import UIKit

struct Core {
    static private let widthMultiplier: CGFloat = 0.7143
    
    static var elementWidth: CGFloat {
        return UIScreen.main.bounds.width * widthMultiplier
    }
}
