import UIKit

extension UIView {
    func roundCorners(radius: CGFloat? = nil, clips: Bool? = nil) {
        if let radius = radius {
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = frame.width/2
        }
        
        if let clips = clips {
            clipsToBounds = clips
        }
    }
    
    func setShadow(offsetSize: CGSize = CGSize(width: 5, height: 5), color: CGColor = UIColor.darkGray.cgColor, opacity: Float = 0.2, radius: CGFloat = 5) {
        layer.shadowOffset = offsetSize
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func removeShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
    }
}
