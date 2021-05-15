import Foundation

class PhoneValidator {
    
    private let validMasks = [ "+370 6xx xxxxx",
                               "8 6xx xxxxx",
                               "6xx xxxxx",
                               "00 370 6xx xxxxx"
    ]
    
    lazy private var prefixes: [String] = {
        var prefixes: [String] = []
        for mask in validMasks {
            let compactMask = mask.replacingOccurrences(of: " ", with: "")
            let prefix = compactMask.replacingOccurrences(of: "x", with: "")
            prefixes.append(prefix)
        }
        return prefixes
    }()
    
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
    
    func validationNote(number: String) -> String {
        guard !isValid(number: number) else {
            return "Valid number"
        }
        guard !number.isEmpty else {
            return ""
        }
        
        for prefix in prefixes {
            if number.count < prefix.count {
                
            }
            
        }
        
        return "TestNote"
    }
}
