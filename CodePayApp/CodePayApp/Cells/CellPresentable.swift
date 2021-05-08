import UIKit

protocol CellPresentable {
    static var cellID: String { get }
}

extension CellPresentable where Self: AnyObject {
    static var cellID: String {
        return String(describing: self)
    }
}
