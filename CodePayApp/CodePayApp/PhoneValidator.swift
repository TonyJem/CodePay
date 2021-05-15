import Foundation

class PhoneValidator {
    
    let masks = [ "+370 6xx xxxxx",
                  "8 6xx xxxxx",
                  "6xx xxxxx",
                  "00 370 6xx xxxxx"
    ]
    
    func isValid(number: String) -> Bool {
        for mask in masks {
            let compactMask = mask.replacingOccurrences(of: " ", with: "")
            let prefix = compactMask.replacingOccurrences(of: "x", with: "")
            return number.count == compactMask.count && number.hasPrefix(prefix)
        }
        return false
    }
}
