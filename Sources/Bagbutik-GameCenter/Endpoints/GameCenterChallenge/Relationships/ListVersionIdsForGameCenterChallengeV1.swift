import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the challenges for a Game Center group
     Get challenge information for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallenges-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForGameCenterChallengeV1(id: String,
                                                       limit: Int? = nil) -> Request<GameCenterChallengeVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
