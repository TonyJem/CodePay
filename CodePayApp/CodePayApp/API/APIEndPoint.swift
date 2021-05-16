import Foundation

enum APIEndpoint {
    case users
    case accounts
    
    var url: URL? {
        switch self {
        case .users:
          return makeURL(endpoint: "user")
        case .accounts:
          return makeURL(endpoint: "account")
        }
    }
}

private extension APIEndpoint {
    var baseURL: String {
        "https://60850e319b2bed001704180b.mockapi.io/api/v1/"
    }
    
    func makeURL(endpoint: String) -> URL? {
        let urlString = baseURL + endpoint
        return URL(string: urlString)
    }
}
