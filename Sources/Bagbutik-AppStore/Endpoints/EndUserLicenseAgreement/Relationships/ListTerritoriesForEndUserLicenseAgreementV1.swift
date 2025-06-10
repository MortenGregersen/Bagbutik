import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Territories for an End User License Agreement
     List all the App Store territories to which a specific custom app license agreement applies.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-endUserLicenseAgreements-_id_-territories>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoriesForEndUserLicenseAgreementV1(id: String,
                                                            fields: [ListTerritoriesForEndUserLicenseAgreementV1.Field]? = nil,
                                                            limit: Int? = nil) -> Request<TerritoriesWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/endUserLicenseAgreements/\(id)/territories",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListTerritoriesForEndUserLicenseAgreementV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }
}
