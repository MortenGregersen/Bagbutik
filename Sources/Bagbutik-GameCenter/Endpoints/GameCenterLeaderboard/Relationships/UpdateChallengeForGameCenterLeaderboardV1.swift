import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/gameCenterLeaderboards/{id}/relationships/challenge

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboards-_id_-relationships-challenge>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateChallengeForGameCenterLeaderboardV1(id: String,
                                                          requestBody: GameCenterLeaderboardChallengeLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards/\(id)/relationships/challenge",
            method: .patch,
            requestBody: requestBody)
    }
}
