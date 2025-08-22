import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List nominations
     Get all featuring nominations.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-nominations>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listNominationsV1(fields: [ListNominationsV1.Field]? = nil,
                                  filters: [ListNominationsV1.Filter]? = nil,
                                  includes: [ListNominationsV1.Include]? = nil,
                                  sorts: [ListNominationsV1.Sort]? = nil,
                                  limits: [ListNominationsV1.Limit]? = nil) -> Request<NominationsResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListNominationsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type nominations
        case nominations([Nominations])

        public enum Nominations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdByActor
            case createdDate
            case description
            case deviceFamilies
            case hasInAppEvents
            case inAppEvents
            case lastModifiedByActor
            case lastModifiedDate
            case launchInSelectMarketsFirst
            case locales
            case name
            case notes
            case preOrderEnabled
            case publishEndDate
            case publishStartDate
            case relatedApps
            case state
            case submittedByActor
            case submittedDate
            case supplementalMaterialsUris
            case supportedTerritories
            case type

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Nominations(rawValue: string) {
                    self = value
                } else if let value = Nominations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Nominations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `state`
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'relatedApps'
        case relatedApps([String])
        /// Filter by attribute 'state'
        case state([Nomination.Attributes.State])
        /// Filter by attribute 'type'
        case type([Nomination.Attributes.Type])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case createdByActor
        case inAppEvents
        case lastModifiedByActor
        case relatedApps
        case submittedByActor
        case supportedTerritories
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case lastModifiedDateAscending = "lastModifiedDate"
        case lastModifiedDateDescending = "-lastModifiedDate"
        case nameAscending = "name"
        case nameDescending = "-name"
        case publishEndDateAscending = "publishEndDate"
        case publishEndDateDescending = "-publishEndDate"
        case publishStartDateAscending = "publishStartDate"
        case publishStartDateDescending = "-publishStartDate"
        case typeAscending = "type"
        case typeDescending = "-type"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related inAppEvents returned (when they are included) - maximum 50
        case inAppEvents(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related relatedApps returned (when they are included) - maximum 50
        case relatedApps(Int)
        /// Maximum number of related supportedTerritories returned (when they are included) - maximum 200
        case supportedTerritories(Int)
    }
}
