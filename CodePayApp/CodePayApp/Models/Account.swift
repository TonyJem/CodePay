import Foundation

struct Account: Codable {
    var phoneFullNumber: String
    var password: String
    var currencyAcronym: String
    
    init(phoneFullNumber: String, password: String, currencyAcronym: String) {
        self.phoneFullNumber = phoneFullNumber
        self.password = password
        self.currencyAcronym = currencyAcronym
    }
}
