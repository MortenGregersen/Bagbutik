import Bagbutik_Core

public extension Request {
    /**
     # GET /v1/appEvents/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appevents_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related localizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventV1(id: String,
                              fields: [GetAppEventV1.Field]? = nil,
                              includes: [GetAppEventV1.Include]? = nil,
                              limit: Int? = nil) -> Request<AppEventResponse, ErrorResponse>
    {
        .init(path: "/v1/appEvents/\(id)", method: .get, parameters: .init(fields: fields,
                                                                           includes: includes,
                                                                           limit: limit))
    }
}

public enum GetAppEventV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case localizations
    }
}
