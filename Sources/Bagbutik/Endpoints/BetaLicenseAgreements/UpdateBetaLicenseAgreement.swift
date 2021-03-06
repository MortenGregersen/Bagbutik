public extension Request {
    /**
      # Modify a Beta License Agreement
      Update the text for your beta license agreement.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_license_agreement>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: BetaLicenseAgreement representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBetaLicenseAgreement(id: String,
                                           requestBody: BetaLicenseAgreementUpdateRequest) -> Request<BetaLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaLicenseAgreements/\(id)", method: .patch, requestBody: requestBody)
    }
}
