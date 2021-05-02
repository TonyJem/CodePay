import UIKit

final class PhoneInputView: InputView {
    override var type: InputViewType {
        get {
            return .phone
        }
        set {
            super.type = newValue
        }
    }
}
