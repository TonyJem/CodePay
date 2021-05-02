import UIKit

final class PasswordInputView: InputView {
    override var type: InputViewType {
        get {
            return .password
        }
        set {
            super.type = newValue
        }
    }
}
