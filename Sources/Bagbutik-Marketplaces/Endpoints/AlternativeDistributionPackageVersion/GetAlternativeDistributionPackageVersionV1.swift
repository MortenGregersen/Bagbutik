import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read information for an alternative distribution package version
     Get detail information about a specific alternative distribution package version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageVersionV1(id: String,
                                                           fields: [GetAlternativeDistributionPackageVersionV1.Field]? = nil,
                                                           includes: [GetAlternativeDistributionPackageVersionV1.Include]? = nil,
                                                           limits: [GetAlternativeDistributionPackageVersionV1.Limit]? = nil) -> Request<AlternativeDistributionPackageVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionPackageVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                        includes: includes,
                                                                                                        limits: limits))
    }
}

public enum GetAlternativeDistributionPackageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageDeltas
        case alternativeDistributionPackageDeltas([AlternativeDistributionPackageDeltas])
        /// The fields to include for returned resources of type alternativeDistributionPackageVariants
        case alternativeDistributionPackageVariants([AlternativeDistributionPackageVariants])
        /// The fields to include for returned resources of type alternativeDistributionPackageVersions
        case alternativeDistributionPackageVersions([AlternativeDistributionPackageVersions])

        public enum AlternativeDistributionPackageDeltas: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate
        }

        public enum AlternativeDistributionPackageVariants: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate
        }

        public enum AlternativeDistributionPackageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionPackage
            case deltas
            case fileChecksum
            case state
            case url
            case urlExpirationDate
            case variants
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case alternativeDistributionPackage
        case deltas
        case variants
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related deltas returned (when they are included) - maximum 50
        case deltas(Int)
        /// Maximum number of related variants returned (when they are included) - maximum 50
        case variants(Int)
    }
}
