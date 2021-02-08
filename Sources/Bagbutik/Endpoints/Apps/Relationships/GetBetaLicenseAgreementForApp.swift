public extension Request {
    enum GetBetaLicenseAgreementForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type betaLicenseAgreements
            case betaLicenseAgreements([BetaLicenseAgreements])

            public enum BetaLicenseAgreements: String, ParameterValue, CaseIterable {
                case agreementText
                case app
            }
        }
    }

    /**
      # Read the Beta License Agreement of an App
      Get the beta license agreement for a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_beta_license_agreement_of_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaLicenseAgreementForApp(id: String,
                                              fields: [GetBetaLicenseAgreementForApp.Field]? = nil) -> Request<BetaLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/betaLicenseAgreement", method: .get, parameters: .init(fields: fields))
    }
}
