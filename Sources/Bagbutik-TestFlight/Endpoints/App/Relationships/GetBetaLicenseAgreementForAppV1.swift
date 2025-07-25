import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Beta License Agreement of an App
     Get the beta license agreement for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaLicenseAgreement>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaLicenseAgreementForAppV1(id: String,
                                                fields: [GetBetaLicenseAgreementForAppV1.Field]? = nil) -> Request<BetaLicenseAgreementWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/betaLicenseAgreement",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaLicenseAgreementForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])

        public enum BetaLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
        }
    }
}
