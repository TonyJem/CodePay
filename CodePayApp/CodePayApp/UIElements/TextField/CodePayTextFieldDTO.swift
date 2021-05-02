import UIKit

struct CodePayTextFieldDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    let textAlignment: NSTextAlignment
    
    static var regular: CodePayTextFieldDTO {
        return CodePayTextFieldDTO(fontSize: 17, fontColor: Colors.lightBlue, weight: .medium, textAlignment: .left)
    }
}
