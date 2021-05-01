import UIKit

struct CodePayLabelDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    
    static var heading: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 24, fontColor: Colors.lightBlue, weight: .semibold)
    }
}
