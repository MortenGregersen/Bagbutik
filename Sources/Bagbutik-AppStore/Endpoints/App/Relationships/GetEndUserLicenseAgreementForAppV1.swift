public extension Request {
    /**
     # Read the End User License Agreement Information of an App
     Get the custom end user license agreement (EULA) for a specific app and the territories where the agreement applies.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_end_user_license_agreement_information_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getEndUserLicenseAgreementForAppV1(id: String,
                                                   fields: [GetEndUserLicenseAgreementForAppV1.Field]? = nil) -> Request<EndUserLicenseAgreementResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/endUserLicenseAgreement", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetEndUserLicenseAgreementForAppV1 {
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
