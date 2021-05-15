import Foundation

class PhoneValidator {
    
    private let validMasks = [ "+370 6xx xxxxx",
                               "8 6xx xxxxx",
                               "6xx xxxxx",
                               "00 370 6xx xxxxx"
    ]
    
    lazy private var compactMasks: [String] = {
        return without(symbol: " ", in: validMasks)
    }()
    
    lazy private var maskPrefixes: [String] = {
        return without(symbol: "x", in: compactMasks)
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
            if compactMasks[index].count < number.count {
                return "Too long number"
            }
            if number.hasPrefix(maskPrefix) {
                let maskSuffix = compactMasks[index].dropFirst(number.count)
                return number + maskSuffix
            }
        }
        return "Invalid number"
    }
}

private extension PhoneValidator {
    func without(symbol: String, in array: [String] ) -> [String] {
        var new: [String] = []
        array.forEach {
            let newItem = $0.replacingOccurrences(of: symbol, with: "")
            new.append(newItem)
        }
        return new
    }
}
