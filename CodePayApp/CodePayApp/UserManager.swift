import Foundation
import Alamofire

struct UserManager {
    static var candidateUser = User(phone: "", password: "")
    
    static func addCandidatePhone(phone: String) {
        candidateUser.phone = phone
    }
    
    static func addCandidatePassword(password: String) {
        candidateUser.password = password
    }
    
    static func postMethod() {

        let params: Parameters = [
            "phoneNumber": "37060088888",
            "password": "testPassword"
        ]
        
        AF.request("https://60850e319b2bed001704180b.mockapi.io/api/v1/user", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("🔴 Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("🔴 Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("🔴 Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("🔴 Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}
