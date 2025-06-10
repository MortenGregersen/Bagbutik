import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the End User License Agreement Information of an App
     Get the custom end user license agreement (EULA) for a specific app and the territories where the agreement applies.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-endUserLicenseAgreement>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getEndUserLicenseAgreementForAppV1(id: String,
                                                   fields: [GetEndUserLicenseAgreementForAppV1.Field]? = nil) -> Request<EndUserLicenseAgreementWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/endUserLicenseAgreement",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetEndUserLicenseAgreementForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])

        public enum EndUserLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories
        }
    }
}
