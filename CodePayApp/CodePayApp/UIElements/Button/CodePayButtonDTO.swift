 import UIKit
 
 struct CodePayButtonDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat?
    
    static var submit: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 22, fontColor: Colors.white, weight: .semibold,
                                backgroundColor: Colors.lightBlue, cornerRadius: 30)
    }
    
    static var secondary: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 15, fontColor: Colors.gray, weight: .medium)
    }
    
    static var placeholder: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 15, fontColor: Colors.gray, weight: .medium)
    }
    
    init(fontSize: CGFloat, fontColor: UIColor, weight: UIFont.Weight,
         backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.weight = weight
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
 }
