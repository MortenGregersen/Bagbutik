import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/appEvents

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_apps_id_appEvents>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEventsForAppV1(id: String,
                                      fields: [ListAppEventsForAppV1.Field]? = nil,
                                      filters: [ListAppEventsForAppV1.Filter]? = nil,
                                      includes: [ListAppEventsForAppV1.Include]? = nil,
                                      limits: [ListAppEventsForAppV1.Limit]? = nil) -> Request<AppEventsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/appEvents", method: .get, parameters: .init(fields: fields,
                                                                                filters: filters,
                                                                                includes: includes,
                                                                                limits: limits))
    }
}

public enum ListAppEventsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
        /// The fields to include for returned resources of type appEvents
        case appEvents([AppEvents])

        public enum AppEventLocalizations: String, ParameterValue, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case shortDescription
        }

        public enum AppEvents: String, ParameterValue, CaseIterable {
            case app
            case archivedTerritorySchedules
            case badge
            case deepLink
            case eventState
            case localizations
            case primaryLocale
            case priority
            case purchaseRequirement
            case purpose
            case referenceName
            case territorySchedules
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'eventState'
        case eventState([EventState])
        /// Filter by id(s)
        case id([String])

        public enum EventState: String, ParameterValue, CaseIterable {
            case draft = "DRAFT"
            case readyForReview = "READY_FOR_REVIEW"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case rejected = "REJECTED"
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case published = "PUBLISHED"
            case past = "PAST"
            case archived = "ARCHIVED"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case localizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
