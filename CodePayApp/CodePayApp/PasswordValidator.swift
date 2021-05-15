import Foundation

class PasswordValidator {
    
    enum PasswordError: Error {
        case passwordDoNotMatch
        case passwordIsToShort
        case noUpperCaseCharacterInPassword
        case noLowerCaseCharacterInPassword
        case noNumericCharacterInPassword
        case noSpecialCharacterInPassword
        
        var errorDescription: String {
            switch self {
            case .passwordDoNotMatch:
                return "Your password and confirmation password do not match."
            case .passwordIsToShort:
                return "Your password must be at least 8 characters."
            case .noUpperCaseCharacterInPassword:
                return "Your password must contain at least one upper case, or capital, letter."
            case .noLowerCaseCharacterInPassword:
                return "Your password must contain at least one lower case letter."
            case .noNumericCharacterInPassword:
                return "Your password must contain at least one number digit."
            case .noSpecialCharacterInPassword:
                return "Your password must contain at least one special character from following: \n$, !, &, ^, %, $, #, @, (, ), /"
            }
        }
    }
    
    static func createPassword(password: String, confirmPassword: String) throws {
        

        
        guard password == confirmPassword else {
            throw PasswordError.passwordDoNotMatch
        }
        
        guard password.count >= 8 else {
            throw PasswordError.passwordIsToShort
        }
        
        guard password.hasUppercase else {
            throw PasswordError.noUpperCaseCharacterInPassword
        }
        
        guard password.hasLowercase else {
            throw PasswordError.noLowerCaseCharacterInPassword
        }
        
        guard password.hasNumber else {
            throw PasswordError.noNumericCharacterInPassword
        }
        
        
        guard password.hasSpecialCharacter else {
            throw PasswordError.noSpecialCharacterInPassword
        }
        
    
    }
    
    
    
}



