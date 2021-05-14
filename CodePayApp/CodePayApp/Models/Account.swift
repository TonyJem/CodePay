import Foundation

struct Account: Codable {
    var phone: String
    var password: String
    var currency: String
    
    init(phone: String, password: String, currency: String) {
        self.phone = phone
        self.password = password
        self.currency = currency
    }
}
