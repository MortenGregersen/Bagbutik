public extension Request {
    /**
      # Modify an End User License Agreement
      Update the text or territories for your custom end user license agreement.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_end_user_license_agreement>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateEndUserLicenseAgreement(id: String,
                                              requestBody: EndUserLicenseAgreementUpdateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/endUserLicenseAgreements/\(id)", method: .patch, requestBody: requestBody)
    }
}
