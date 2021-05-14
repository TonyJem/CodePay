import UIKit

struct CodePayLabelDTO {
    
    let fontSize: CGFloat
    let fontColor: UIColor
    let weight: UIFont.Weight
    
    static var heading: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 24, fontColor: Colors.lightBlue, weight: .semibold)
    }
    
    static var title: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 17, fontColor: Colors.lightBlue, weight: .medium)
    }
    
    static var label: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 36, fontColor: Colors.lightBlue, weight: .semibold)
    }
    
    static var note: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 22, fontColor: Colors.lightBlue, weight: .medium)
    }
    
    static var navBarTitle: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 19, fontColor: Colors.gray, weight: .medium)
    }
    
    static var flag: CodePayLabelDTO {
        return CodePayLabelDTO(fontSize: 45, fontColor: Colors.lightBlue, weight: .medium)
    }
}
