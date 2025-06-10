import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List merchant IDs
     List all merchant Ids for your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-merchantIds>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMerchantIdsV1(fields: [ListMerchantIdsV1.Field]? = nil,
                                  filters: [ListMerchantIdsV1.Filter]? = nil,
                                  includes: [ListMerchantIdsV1.Include]? = nil,
                                  sorts: [ListMerchantIdsV1.Sort]? = nil,
                                  limits: [ListMerchantIdsV1.Limit]? = nil) -> Request<MerchantIdsResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListMerchantIdsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type certificates
        case certificates([Certificates])
        /// The fields to include for returned resources of type merchantIds
        case merchantIds([MerchantIds])

        public enum Certificates: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activated
            case certificateContent
            case certificateType
            case displayName
            case expirationDate
            case name
            case platform
            case serialNumber
        }

        public enum MerchantIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case certificates
            case identifier
            case name
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
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
