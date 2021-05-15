import Foundation

class PhoneValidator {
    
    let mask = "+370 6xx xxxxx"
    
    var prefix: String {
        let prefix = mask.trimmingCharacters(in: .whitespacesAndNewlines)

        return prefix
    }
    
    
}
