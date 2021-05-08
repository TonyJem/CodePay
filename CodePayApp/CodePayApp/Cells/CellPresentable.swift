import UIKit

protocol CellPresentable {
    var height: CGFloat { get }
    
    func cellIdentifier() -> String
}
