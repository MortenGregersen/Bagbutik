import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read End User License Agreement Information
     Get the custom end user license agreement associated with an app, and the territories it applies to.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-endUserLicenseAgreements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related territories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getEndUserLicenseAgreementV1(id: String,
                                             fields: [GetEndUserLicenseAgreementV1.Field]? = nil,
                                             includes: [GetEndUserLicenseAgreementV1.Include]? = nil,
                                             limit: GetEndUserLicenseAgreementV1.Limit? = nil) -> Request<EndUserLicenseAgreementResponse, ErrorResponse> {
        .init(
            path: "/v1/endUserLicenseAgreements/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetEndUserLicenseAgreementV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum EndUserLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case territories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related territories returned (when they are included) - maximum 50
        case territories(Int)
    }
}
