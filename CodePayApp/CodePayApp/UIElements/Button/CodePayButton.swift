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
        
        if let alignment = dto.titleAlignment {
            switch alignment {
            case .right:
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
            case .left:
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            default:
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            }
        }
    }
 }
