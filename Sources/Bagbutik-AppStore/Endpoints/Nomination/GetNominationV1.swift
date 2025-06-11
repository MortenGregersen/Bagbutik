import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read details for a nomination
     Get information for a specific featuring nomination.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-nominations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getNominationV1(id: String,
                                fields: [GetNominationV1.Field]? = nil,
                                includes: [GetNominationV1.Include]? = nil,
                                limits: [GetNominationV1.Limit]? = nil) -> Request<NominationResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetNominationV1 {
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
        }
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
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related inAppEvents returned (when they are included) - maximum 50
        case inAppEvents(Int)
        /// Maximum number of related relatedApps returned (when they are included) - maximum 50
        case relatedApps(Int)
        /// Maximum number of related supportedTerritories returned (when they are included) - maximum 200
        case supportedTerritories(Int)
    }
}
