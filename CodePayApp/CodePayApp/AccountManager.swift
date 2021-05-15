struct AccountManager {
    static var candidateAccount = Account(phone: "", password: "", currency: "")
    
    static func addCandidatePhone(phone: String) {
        candidateAccount.phone = phone
    }
    
    static func addCandidatePassword(password: String) {
        candidateAccount.password = password
    }
    
    static func addCandidateCurrency(currency: String) {
        candidateAccount.currency = currency
    }
    
    static func registerAccount() {
        
    }
}
