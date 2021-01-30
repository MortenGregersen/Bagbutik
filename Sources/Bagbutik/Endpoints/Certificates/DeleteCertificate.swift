public extension Request {
    /**
      # Revoke a Certificate
      Revoke a lost, stolen, compromised, or expiring signing certificate.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/revoke_a_certificate>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteCertificate(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/certificates/\(id)", method: .delete)
    }
}
