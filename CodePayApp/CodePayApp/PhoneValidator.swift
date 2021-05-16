import Foundation

class PhoneValidator {
    
    private let convencionalPrefix = "3706"
    
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
            
            guard number.hasPrefix(maskPrefix) else { continue }
            let maskSuffix = compactMasks[index].dropFirst(number.count)
            if compactMasks[index].count < number.count {
                return "Too long number"
            } else {
                return number + maskSuffix
            }
        }
        return "Invalid number"
    }
    
    func initialNumber(from number: String) -> String {
        for maskPrefix in maskPrefixes {
            if number == maskPrefix.prefix(number.count) {
                return maskPrefix
            }
        }
        return number
    }
    
    func converted(number: String) -> String {
        return convencionalPrefix + deletingPrefix(from: number)
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
    
    func deletingPrefix(from number: String) -> String {
        for maskPrefix in maskPrefixes {
            if number.hasPrefix(maskPrefix) {
                return String(number.dropFirst(maskPrefix.count))
            }
        }
        return ""
    }
}
