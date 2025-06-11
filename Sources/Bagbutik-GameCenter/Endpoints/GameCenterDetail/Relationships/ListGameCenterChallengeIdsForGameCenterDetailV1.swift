import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read challenge Ids for a Game Center detail
     List all the challenge IDs for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-gameCenterChallenges>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterChallengeIdsForGameCenterDetailV1(id: String,
                                                                limit: Int? = nil) -> Request<GameCenterDetailGameCenterChallengesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterChallenges",
            method: .get,
            parameters: .init(limit: limit))
    }
}
