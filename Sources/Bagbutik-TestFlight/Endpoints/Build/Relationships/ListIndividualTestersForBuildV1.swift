import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Individual Testers for a Build
     Get a list of beta testers individually assigned to a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-individualTesters>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIndividualTestersForBuildV1(id: String,
                                                fields: [ListIndividualTestersForBuildV1.Field]? = nil,
                                                limit: Int? = nil) -> Request<BetaTestersWithoutIncludesResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/individualTesters", method: .get, parameters: .init(fields: fields,
                                                                                          limit: limit))
    }
}

public enum ListIndividualTestersForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])

        public enum BetaTesters: String, Sendable, ParameterValue, Codable, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
            case state
        }
    }
}
