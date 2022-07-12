public extension Request {
    /**
      # Delete an End User License Agreement
      Delete the custom end user license agreement that is associated with an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_end_user_license_agreement>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteEndUserLicenseAgreementV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/endUserLicenseAgreements/\(id)", method: .delete)
    }
}
