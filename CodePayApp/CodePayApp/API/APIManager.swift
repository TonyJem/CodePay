import Foundation
import Alamofire

struct APIManager {
    func postNewUserAccount(phoneNumber: String, password: String, currency: String) {
        postRequest(for: APIEndpoint.users.url,
                    with: userParameters(phoneNumber: phoneNumber, password: password))
        postRequest(for: APIEndpoint.accounts.url,
                    with: accountParameters(phoneNumber: phoneNumber, currency: currency))
    }
}

private extension APIManager {
    func userParameters(phoneNumber: String, password: String) -> Parameters {
        var params: Parameters = [
            "phoneNumber": "",
            "password": ""
        ]
        params["phoneNumber"] = phoneNumber
        params["password"] = password
        return params
    }
    
    func accountParameters(phoneNumber: String, currency: String) -> Parameters {
        var params: Parameters = [
            "phoneNumber": "",
            "currency": "",
            "balance": 0
        ]
        params["phoneNumber"] = phoneNumber
        params["currency"] = currency
        return params
    }
    
    func postRequest(for destination: URL?, with parameters: Parameters) {
        guard let destination = destination else { return }
        AF.request(destination, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
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
                    print("🔴 Error: Cannot print JSON in String")
                    return
                }
                
                print("🟢 Server respond:\n\(prettyPrintedJson)")
            } catch {
                print("🔴 Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}
    
