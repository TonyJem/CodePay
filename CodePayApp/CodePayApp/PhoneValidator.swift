import Foundation

class PhoneValidator {
    
    let validMasks = [ "+370 6xx xxxxx",
                       "8 6xx xxxxx",
                       "6xx xxxxx",
                       "00 370 6xx xxxxx"
    ]
    
    func isValid(number: String) -> Bool {
        for mask in validMasks {
            let compactMask = mask.replacingOccurrences(of: " ", with: "")
            let prefix = compactMask.replacingOccurrences(of: "x", with: "")
            if number.count == compactMask.count && number.hasPrefix(prefix) {
                return true
            }
        }
        return false
    }
}
