import UIKit

class CodePayLabel: UILabel {
    func setup(title: String?, dto: CodePayLabelDTO) {
        guard let title = title else {
            isHidden = true
            return
        }
        text = title
        font = UIFont.systemFont(ofSize: dto.fontSize, weight: dto.weight)
        textColor = dto.fontColor
    }
}
