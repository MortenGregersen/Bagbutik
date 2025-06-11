import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a challenge
     Update details for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallenges-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterChallenge representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterChallengeV1(id: String,
                                            requestBody: GameCenterChallengeUpdateRequest) -> Request<GameCenterChallengeResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
