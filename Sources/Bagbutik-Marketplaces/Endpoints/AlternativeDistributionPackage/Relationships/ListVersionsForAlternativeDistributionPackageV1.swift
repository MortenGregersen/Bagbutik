import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read version information for an alternative distribution package
     Get version detail information about a specific alternative distribution package.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackages-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForAlternativeDistributionPackageV1(id: String,
                                                                fields: [ListVersionsForAlternativeDistributionPackageV1.Field]? = nil,
                                                                filters: [ListVersionsForAlternativeDistributionPackageV1.Filter]? = nil,
                                                                includes: [ListVersionsForAlternativeDistributionPackageV1.Include]? = nil,
                                                                limits: [ListVersionsForAlternativeDistributionPackageV1.Limit]? = nil) -> Request<AlternativeDistributionPackageVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackages/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListVersionsForAlternativeDistributionPackageV1 {
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
        /// The fields to include for returned resources of type alternativeDistributionPackages
        case alternativeDistributionPackages([AlternativeDistributionPackages])

        public enum AlternativeDistributionPackageDeltas: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageDeltas(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageDeltas(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageDeltas value: \(string)"
                    )
                }
            }
        }

        public enum AlternativeDistributionPackageVariants: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageVariants(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageVariants(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageVariants value: \(string)"
                    )
                }
            }
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageVersions(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageVersions value: \(string)"
                    )
                }
            }
        }

        public enum AlternativeDistributionPackages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case sourceFileChecksum
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackages(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackages value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, Sendable, ParameterValue, Codable, CaseIterable {
            case completed = "COMPLETED"
            case replaced = "REPLACED"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = State(rawValue: string) {
                    self = value
                } else if let value = State(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid State value: \(string)"
                    )
                }
            }
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related variants returned (when they are included) - maximum 50
        case variants(Int)
    }
}
