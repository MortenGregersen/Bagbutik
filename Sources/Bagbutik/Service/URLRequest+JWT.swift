import Foundation

extension URLRequest {
    mutating func addJWTAuthorizationHeader(_ jwt: String) {
        addValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
    }
}
