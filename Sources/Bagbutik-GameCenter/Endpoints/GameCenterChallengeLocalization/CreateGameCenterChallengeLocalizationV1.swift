import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a challenge localization
     Add a localization for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeLocalizations>

     - Parameter requestBody: GameCenterChallengeLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeLocalizationV1(requestBody: GameCenterChallengeLocalizationCreateRequest) -> Request<GameCenterChallengeLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
