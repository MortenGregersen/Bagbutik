import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Pass Type Ids
     Find and list pass type IDs that are registered to your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-passTypeIds>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPassTypeIdsV1(fields: [ListPassTypeIdsV1.Field]? = nil,
                                  filters: [ListPassTypeIdsV1.Filter]? = nil,
                                  includes: [ListPassTypeIdsV1.Include]? = nil,
                                  sorts: [ListPassTypeIdsV1.Sort]? = nil,
                                  limits: [ListPassTypeIdsV1.Limit]? = nil) -> Request<PassTypeIdsResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListPassTypeIdsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])
        /// The fields to include for returned resources of type passTypeIds
        case passTypeIds([PassTypeIds])

        public enum Certificates: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activated
            case certificateContent
            case certificateType
            case displayName
            case expirationDate
            case name
            case passTypeId
            case platform
            case serialNumber

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Certificates(rawValue: string) {
                    self = value
                } else if let value = Certificates(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Certificates value: \(string)"
                    )
                }
            }
        }

        public enum PassTypeIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case certificates
            case identifier
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PassTypeIds(rawValue: string) {
                    self = value
                } else if let value = PassTypeIds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PassTypeIds value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'identifier'
        case identifier([String])
        /// Filter by attribute 'name'
        case name([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case certificates
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case idAscending = "id"
        case idDescending = "-id"
        case identifierAscending = "identifier"
        case identifierDescending = "-identifier"
        case nameAscending = "name"
        case nameDescending = "-name"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related certificates returned (when they are included) - maximum 50
        case certificates(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
