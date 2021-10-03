public extension Request {
    /**
      # Create an End User License Agreement
      Add a custom end user license agreement (EULA) to an app and configure the territories to which it applies.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_end_user_license_agreement>

      - Parameter requestBody: EndUserLicenseAgreement representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createEndUserLicenseAgreement(requestBody: EndUserLicenseAgreementCreateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse> {
        return .init(path: "/v1/endUserLicenseAgreements", method: .post, requestBody: requestBody)
    }
}
