 import UIKit

 class CodePayButton: UIButton {

    var dto: CodePayButtonDTO?
    
    func setup(title: String, dto: CodePayButtonDTO) {
        self.dto = dto
        setTitle(title, for: .normal)
        setTitleColor(dto.fontColor, for: .normal)
        titleLabel?.font = .systemFont(ofSize: dto.fontSize, weight: dto.weight)
        
        if let backgroundColor = dto.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let cornerRadius = dto.cornerRadius {
            layer.cornerRadius = cornerRadius
        }
    }
 }
