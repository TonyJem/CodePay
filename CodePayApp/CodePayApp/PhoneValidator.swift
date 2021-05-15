import Foundation

class PhoneValidator {
    
    private let validMasks = [ "+370 6xx xxxxx",
                               "8 6xx xxxxx",
                               "6xx xxxxx",
                               "00 370 6xx xxxxx"
    ]
    
    lazy private var compactMasks: [String] = {
        var masks: [String] = []
        validMasks.forEach {
            let compactMask = $0.replacingOccurrences(of: " ", with: "")
            masks.append(compactMask)
        }
        return masks
    }()
    
    lazy private var maskPrefixes: [String] = {
        var prefixes: [String] = []
        compactMasks.forEach {
            let prefix = $0.replacingOccurrences(of: "x", with: "")
            prefixes.append(prefix)
        }
        return prefixes
    }()
    
    func isValid(number: String) -> Bool {
        for (index, mask) in compactMasks.enumerated() {
            if number.count == mask.count &&
                number.hasPrefix(maskPrefixes[index]) {
                return true
            }
        }
        return false
    }
    
    func validationNote(number: String) -> String {
        guard !isValid(number: number) else {
            return "Number is Valid"
        }
        guard !number.isEmpty else {
            return ""
        }
        
        for (index, maskPrefix) in maskPrefixes.enumerated() {
            if number.count <= maskPrefix.count &&
                number == maskPrefix.prefix(number.count) {
                return compactMasks[index]
            }
            
            if number.hasPrefix(maskPrefix) &&
                number.count <= compactMasks[index].count {
                let maskSuffix = compactMasks[index].dropFirst(number.count)
                return number + maskSuffix
            }
        }
        return "Invalid number"
    }
}
