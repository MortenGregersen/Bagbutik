import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a challenge localization
     Update localization information for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallengeLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterChallengeLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterChallengeLocalizationV1(id: String,
                                                        requestBody: GameCenterChallengeLocalizationUpdateRequest) -> Request<GameCenterChallengeLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
