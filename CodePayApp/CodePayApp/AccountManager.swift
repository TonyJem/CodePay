struct AccountManager {
    static let initialPhone = ""
    static let initialPassword = ""
    static let initialCurrency = Currency(isSelected: false, flag: "", acronym: "", symbol: "", description: "")
  
    static var candidateAccount = Account(phone: initialPhone, password: initialPassword, currency: initialCurrency)
    
}
