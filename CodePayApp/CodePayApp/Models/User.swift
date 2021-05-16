import Foundation

struct User: Codable {
    var id: String
    var phone: String
    var password: String
    
    init(phone: String, password: String) {
        self.id = ""
        self.phone = phone
        self.password = password
    }
}
