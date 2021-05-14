import UIKit

struct Currency {
    var isSelected: Bool
    let flag: String
    let acronym: String
    let symbol: String
    let description: String
    
    var icon: UIImage {
        let iconName = isSelected ? "circleChecked" : "circle"
        return UIImage(imageLiteralResourceName: iconName)
    }
}

class CurrencyModel {
    
    var currencies: [Currency] = [
        Currency(isSelected: false, flag: "🇪🇺", acronym: "EUR", symbol: "\u{20AC}", description: "Euro"),
        Currency(isSelected: false, flag: "🇺🇸", acronym: "USD", symbol: "\u{FF04}", description: "US dollar"),
        Currency(isSelected: true, flag: "🇬🇧", acronym: "GBP", symbol: "\u{00A3}", description: "Pounds sterling"),
        Currency(isSelected: false, flag: "🇷🇺", acronym: "RUB", symbol: "\u{20BD}", description: "Russian ruble"),
        Currency(isSelected: false, flag: "🇯🇵", acronym: "JPY", symbol: "\u{00A5}", description: "Japanese yen")
    ]
}
