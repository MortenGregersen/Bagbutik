import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List deltas information
     List deltas for a specific alternative distribution package version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_deltas_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDeltasForAlternativeDistributionPackageVersionV1(id: String,
                                                                     fields: [ListDeltasForAlternativeDistributionPackageVersionV1.Field]? = nil,
                                                                     limit: Int? = nil) -> Request<AlternativeDistributionPackageDeltasResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionPackageVersions/\(id)/deltas", method: .get, parameters: .init(fields: fields,
                                                                                                               limit: limit))
    }
}

public enum ListDeltasForAlternativeDistributionPackageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageDeltas
        case alternativeDistributionPackageDeltas([AlternativeDistributionPackageDeltas])

        public enum AlternativeDistributionPackageDeltas: String, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate
        }
    }
}
