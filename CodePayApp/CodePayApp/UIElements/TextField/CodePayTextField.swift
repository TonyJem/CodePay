import UIKit

class CodePayTextField: UITextField {
    func setup(title: String?, dto: CodePayTextFieldDTO) {
        guard let title = title else { return }
        text = title
        textAlignment = dto.textAlignment
        font = UIFont.systemFont(ofSize: dto.fontSize, weight: dto.weight)
        textColor = dto.fontColor
    }
}
