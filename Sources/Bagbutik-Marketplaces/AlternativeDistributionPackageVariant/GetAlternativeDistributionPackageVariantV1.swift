import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read information for an alternative distribution package variants
     Get detail information about specific alternative distribution package variants.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_information_for_an_alternative_distribution_package_variants>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageVariantV1(id: String,
                                                           fields: [GetAlternativeDistributionPackageVariantV1.Field]? = nil) -> Request<AlternativeDistributionPackageVariantResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionPackageVariants/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionPackageVariantV1 {
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
