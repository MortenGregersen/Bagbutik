public extension Request {
    /**
      # Read End User License Agreement Information
      Get the custom end user license agreement associated with an app, and the territories it applies to.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_end_user_license_agreement_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related territories returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getEndUserLicenseAgreement(id: String,
                                           fields: [GetEndUserLicenseAgreement.Field]? = nil,
                                           includes: [GetEndUserLicenseAgreement.Include]? = nil,
                                           limit: Int? = nil) -> Request<EndUserLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/endUserLicenseAgreements/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                 includes: includes,
                                                                                                 limit: limit))
    }
}

public enum GetEndUserLicenseAgreement {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum EndUserLicenseAgreements: String, ParameterValue, CaseIterable {
            case agreementText
            case app
            case territories
        }

        public enum Territories: String, ParameterValue, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, territories
    }
}
