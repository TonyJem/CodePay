 import UIKit
 
 struct CodePayButtonDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    let alignment: NSTextAlignment
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat?
    
    static var ctaPrimary: CodePayButtonDTO {
        return CodePayButtonDTO(fontSize: 22, fontColor: Colors.white, weight: .semibold,
                                backgroundColor: Colors.lightBlue, cornerRadius: 30)
    }
    
    init(fontSize: CGFloat, fontColor: UIColor, weight: UIFont.Weight,
         alignment: NSTextAlignment = .center, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.weight = weight
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
 }
