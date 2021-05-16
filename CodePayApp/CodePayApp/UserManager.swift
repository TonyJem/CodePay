import Foundation

struct UserManager {
    static var candidateUser = User(phone: "", password: "")
    
    static func addCandidatePhone(phone: String) {
        candidateUser.phone = phone
    }
    
    static func addCandidatePassword(password: String) {
        candidateUser.password = password
    }
}
