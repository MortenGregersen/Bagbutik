import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read an App Store version’s alternative distribution package
     Read the alternative distribution package for a specific App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_an_app_store_version_s_alternative_distribution_package>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related versions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageForAppStoreVersionV1(id: String,
                                                                      fields: [GetAlternativeDistributionPackageForAppStoreVersionV1.Field]? = nil,
                                                                      includes: [GetAlternativeDistributionPackageForAppStoreVersionV1.Include]? = nil,
                                                                      limit: GetAlternativeDistributionPackageForAppStoreVersionV1.Limit? = nil) -> Request<AlternativeDistributionPackageResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/alternativeDistributionPackage", method: .get, parameters: .init(fields: fields,
                                                                                                                 includes: includes,
                                                                                                                 limits: limit.map { [$0] }))
    }
}

public enum GetAlternativeDistributionPackageForAppStoreVersionV1 {
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
