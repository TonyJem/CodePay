import Foundation

struct RegisterFlow {
    
//    TODO: Move all temp to userDefaults
    static var candidateUser = User(phone: "", password: "")
    
    static func addCandidatePhone(phone: String) {
        candidateUser.phone = phone
    }
    
    static func addCandidatePassword(password: String) {
        candidateUser.password = password
    }
}
