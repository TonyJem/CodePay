import UIKit

struct Currency: Codable {
    var isSelected: Bool
    let flag: String
    let acronym: String
    let symbol: String
    let description: String
}

class CurrencyModel {
    
    var currencies: [Currency] = [
        Currency(isSelected: false, flag: "🇪🇺", acronym: "EUR", symbol: "\u{20AC}", description: "Euro"),
        Currency(isSelected: false, flag: "🇺🇸", acronym: "USD", symbol: "\u{FF04}", description: "US Dollar"),
        Currency(isSelected: false, flag: "🇬🇧", acronym: "GBP", symbol: "\u{00A3}", description: "Pounds Sterling"),
        Currency(isSelected: false, flag: "🇷🇺", acronym: "RUB", symbol: "\u{20BD}", description: "Russian Ruble"),
        Currency(isSelected: false, flag: "🇯🇵", acronym: "JPY", symbol: "\u{00A5}", description: "Japanese Yen"),
        Currency(isSelected: false, flag: "🇲🇳", acronym: "MNT", symbol: "\u{20AE}", description: "Mongolian Tugrik"),
        Currency(isSelected: false, flag: "🇺🇦", acronym: "UAH", symbol: "\u{20B4}", description: "Ukrainian Hryvnia"),
        Currency(isSelected: false, flag: "🇮🇱", acronym: "ILS", symbol: "\u{20AA}", description: "Israeli Shekel"),
        Currency(isSelected: false, flag: "🇮🇳", acronym: "INR", symbol: "\u{20B9}", description: "Indian Rupee"),
        Currency(isSelected: false, flag: "🇵🇭", acronym: "PHP", symbol: "\u{20B1}", description: "Philippine Peso")
    ]
    
    func markCurrency(at row: Int) {
        if let index = currencies.firstIndex(where: {$0.isSelected == true}) {
            currencies[index].isSelected = false
        }
        currencies[row].isSelected = true
    }
}
