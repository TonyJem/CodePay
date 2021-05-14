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
        Currency(isSelected: false, flag: "🇪🇺", acronym: "EUR", symbol: "E", description: "Euro"),
        Currency(isSelected: false, flag: "🇺🇸", acronym: "USD", symbol: "$", description: "US dollar"),
        Currency(isSelected: false, flag: "🇬🇧", acronym: "GBP", symbol: "L", description: "Pounds sterling"),
        Currency(isSelected: false, flag: "🇷🇺", acronym: "RUB", symbol: "P", description: "Russian ruble"),
        Currency(isSelected: false, flag: "🇯🇵", acronym: "JPY", symbol: "Y", description: "Japanese yen")
    ]
}
