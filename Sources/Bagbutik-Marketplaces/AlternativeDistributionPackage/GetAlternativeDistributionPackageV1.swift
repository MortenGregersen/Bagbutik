import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read alternative distribution package information
     Get information about a specific alternative distribution package.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_alternative_distribution_package_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related versions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageV1(id: String,
                                                    fields: [GetAlternativeDistributionPackageV1.Field]? = nil,
                                                    includes: [GetAlternativeDistributionPackageV1.Include]? = nil,
                                                    limit: GetAlternativeDistributionPackageV1.Limit? = nil) -> Request<AlternativeDistributionPackageResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionPackages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                 includes: includes,
                                                                                                 limits: limit.map { [$0] }))
    }
}

public enum GetAlternativeDistributionPackageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageVersions
        case alternativeDistributionPackageVersions([AlternativeDistributionPackageVersions])
        /// The fields to include for returned resources of type alternativeDistributionPackages
        case alternativeDistributionPackages([AlternativeDistributionPackages])

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

        public enum AlternativeDistributionPackages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
            case versions
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case versions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related versions returned (when they are included) - maximum 50
        case versions(Int)
    }
}
