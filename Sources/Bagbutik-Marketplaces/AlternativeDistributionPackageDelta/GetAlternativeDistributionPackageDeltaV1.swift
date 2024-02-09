import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read information for alternative distribution package deltas
     Get detail information about specific alternative distribution package deltas.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_information_for_alternative_distribution_package_deltas>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageDeltaV1(id: String,
                                                         fields: [GetAlternativeDistributionPackageDeltaV1.Field]? = nil) -> Request<AlternativeDistributionPackageDeltaResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionPackageDeltas/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionPackageDeltaV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageDeltas
        case alternativeDistributionPackageDeltas([AlternativeDistributionPackageDeltas])

        public enum AlternativeDistributionPackageDeltas: String, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case url
            case urlExpirationDate
        }
    }
}
