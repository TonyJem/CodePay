import Foundation

struct Account: Codable {
    var id: String
    var phoneNumber: String
    var currency: String
    var balance: Int
    
    init(phoneNumber: String, currency: String, balance: Int) {
        self.id = ""
        self.phoneNumber = phoneNumber
        self.currency = currency
        self.balance = balance
    }
}
