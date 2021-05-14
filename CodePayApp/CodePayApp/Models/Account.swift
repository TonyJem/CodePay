import Foundation

struct Account: Codable {
    var phone: String
    var password: String
    var currency: Currency
    
    
    init(phone: String, password: String, currency: Currency) {
        self.phone = phone
        self.password = password
        self.currency = currency
    }
}
