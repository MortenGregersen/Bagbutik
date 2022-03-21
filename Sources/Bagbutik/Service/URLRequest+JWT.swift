import Foundation
#if canImport(FoundationNetworking)
// Linux support
import FoundationNetworking
#endif

extension URLRequest {
    /**
     Add a JWT authorization header.

     - Parameters:
        - jwt: The signature from the JWT.
      */
    mutating func addJWTAuthorizationHeader(_ jwt: String) {
        addValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
    }
}
