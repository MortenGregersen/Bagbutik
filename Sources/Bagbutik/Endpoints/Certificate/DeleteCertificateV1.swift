public extension Request {
    /**
      # Revoke a Certificate
      Revoke a lost, stolen, compromised, or expiring signing certificate.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/revoke_a_certificate>

      - Parameter id: The id of the requested resource
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCertificateV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/certificates/\(id)", method: .delete)
    }
}
