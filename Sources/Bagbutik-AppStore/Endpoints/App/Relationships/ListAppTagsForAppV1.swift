import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List app tags
     List all app tags for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-appTags>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppTagsForAppV1(id: String,
                                    fields: [ListAppTagsForAppV1.Field]? = nil,
                                    filters: [ListAppTagsForAppV1.Filter]? = nil,
                                    includes: [ListAppTagsForAppV1.Include]? = nil,
                                    sorts: [ListAppTagsForAppV1.Sort]? = nil,
                                    limits: [ListAppTagsForAppV1.Limit]? = nil) -> Request<AppTagsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/appTags",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListAppTagsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appTags
        case appTags([AppTags])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppTags: String, Sendable, ParameterValue, Codable, CaseIterable {
            case name
            case territories
            case visibleInAppStore

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppTags(rawValue: string) {
                    self = value
                } else if let value = AppTags(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppTags value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'visibleInAppStore'
        case visibleInAppStore([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territories
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case nameAscending = "name"
        case nameDescending = "-name"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related territories returned (when they are included) - maximum 50
        case territories(Int)
    }
}
