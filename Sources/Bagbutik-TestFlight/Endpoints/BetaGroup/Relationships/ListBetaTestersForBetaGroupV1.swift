import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Beta Testers in a Beta Group
     Get a list of beta testers contained in a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-betaTesters>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaTestersForBetaGroupV1(id: String,
                                              fields: [ListBetaTestersForBetaGroupV1.Field]? = nil,
                                              limit: Int? = nil) -> Request<BetaTestersWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/betaTesters",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBetaTestersForBetaGroupV1 {
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
