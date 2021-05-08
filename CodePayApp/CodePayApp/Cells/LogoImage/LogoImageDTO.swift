import UIKit

struct LogoImageDTO: CellPresentable {
    let height: CGFloat
    
    func cellIdentifier() -> String {
        return String(describing: LogoImage)
    }
    
    
}
