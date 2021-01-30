public extension Request {
    enum GetEndUserLicenseAgreementForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type endUserLicenseAgreements
            case endUserLicenseAgreements([EndUserLicenseAgreements])

            public enum EndUserLicenseAgreements: String, ParameterValue, CaseIterable {
                case agreementText
                case app
                case territories
            }
        }
    }

    /**
      # Read the End User License Agreement Information of an App
      Get the custom end user license agreement (EULA) for a specific app and the territories where the agreement applies.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_end_user_license_agreement_information_of_an_app>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getEndUserLicenseAgreementForApp(id: String,
                                                 fields: [GetEndUserLicenseAgreementForApp.Field]? = nil) -> Request<EndUserLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/endUserLicenseAgreement", method: .get, parameters: .init(fields: fields))
    }
}
