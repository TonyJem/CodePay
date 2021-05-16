import Foundation
import Alamofire

struct APIManager {
    
    func postNewUser(phoneNumber: String, password: String) {
        
        var params: Parameters = [
            "phoneNumber": "",
            "password": ""
        ]
        params["phoneNumber"] = phoneNumber
        params["password"] = password
        
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
                
                print("🟢 Server respond:\n\(prettyPrintedJson)")
            } catch {
                print("🔴 Error: Trying to convert JSON data to string")
                return
            }
        }
    }

    func postNewAccount(phoneNumber: String, currency: String, balance: Int = 0 ) {
        
        var params: Parameters = [
            "phoneNumber": "",
            "currency": "",
            "balance": 0
        ]
        
        params["phoneNumber"] = phoneNumber
        params["currency"] = currency
        
        AF.request("https://60850e319b2bed001704180b.mockapi.io/api/v1/account", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
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
                
                print("🟢🟢 Server respond:\n\(prettyPrintedJson)")
            } catch {
                print("🔴 Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}
