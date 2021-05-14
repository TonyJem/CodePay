import UIKit

struct Currency {
    var isSelected: Bool
    let flag: String
    let acronym: String
    let symbol: String
    let description: String
    
    var icon: UIImage? {
        isSelected ? UIImage(imageLiteralResourceName: "circleChecked") : nil
    }
}

class CurrencyModel {
    
    var currencies: [Currency] = [
        Currency(isSelected: false, flag: "🇪🇺", acronym: "EUR", symbol: "\u{20AC}", description: "Euro"),
        Currency(isSelected: false, flag: "🇺🇸", acronym: "USD", symbol: "\u{FF04}", description: "US dollar"),
        Currency(isSelected: false, flag: "🇬🇧", acronym: "GBP", symbol: "\u{00A3}", description: "Pounds sterling"),
        Currency(isSelected: false, flag: "🇷🇺", acronym: "RUB", symbol: "\u{20BD}", description: "Russian ruble"),
        Currency(isSelected: false, flag: "🇯🇵", acronym: "JPY", symbol: "\u{00A5}", description: "Japanese yen")
    ]
    
//        for currency in currencies {
//            currency.isSelected = false
//        }
    
    func markCurrency(at row: Int) {
        currencies[0].isSelected = false
        currencies[1].isSelected = false
        currencies[2].isSelected = false
        currencies[3].isSelected = false
        currencies[4].isSelected = false
        
        currencies[row].isSelected = true
    }
}
