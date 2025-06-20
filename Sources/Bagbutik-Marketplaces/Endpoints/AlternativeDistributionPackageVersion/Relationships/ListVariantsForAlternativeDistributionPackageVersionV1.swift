import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List variants information
     List variants for specific alternative distribution package version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVersions-_id_-variants>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVariantsForAlternativeDistributionPackageVersionV1(id: String,
                                                                       fields: [ListVariantsForAlternativeDistributionPackageVersionV1.Field]? = nil,
                                                                       limit: Int? = nil) -> Request<AlternativeDistributionPackageVariantsResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageVersions/\(id)/variants",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListVariantsForAlternativeDistributionPackageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageVariants
        case alternativeDistributionPackageVariants([AlternativeDistributionPackageVariants])

        public enum AlternativeDistributionPackageVariants: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate
        }
    }
}
