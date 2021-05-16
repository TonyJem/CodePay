import Foundation

struct User: Codable {
    var phone: String
    var password: String
    
    init(phone: String, password: String) {
        self.phone = phone
        self.password = password
    }
}
