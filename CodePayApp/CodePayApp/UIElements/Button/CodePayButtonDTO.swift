 import UIKit
 
 struct CodePayButtonDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat?
    let titleAlignment: NSTextAlignment?
    
    static var submit: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 22, fontColor: Colors.white, weight: .semibold,
                                backgroundColor: Colors.lightBlue, cornerRadius: 30)
    }
    
    static var secondary: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 15, fontColor: Colors.gray, weight: .medium)
    }
    
    static var placeholder: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 17, fontColor: .systemGray2, weight: .medium, titleAlignment: .left)
    }
    
    static var phone: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 32, fontColor: .black, weight: .semibold,
                                backgroundColor: Colors.lightBlue, cornerRadius: 35)
    }
    
    init(fontSize: CGFloat, fontColor: UIColor, weight: UIFont.Weight,
         backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil, titleAlignment: NSTextAlignment? = nil) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.weight = weight
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.titleAlignment = titleAlignment
    }
 }
