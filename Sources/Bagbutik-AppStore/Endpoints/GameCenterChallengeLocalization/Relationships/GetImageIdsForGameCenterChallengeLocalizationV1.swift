import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the image ID for a challenge localization
     Get the image ID for a specific Game Center challenge localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterChallengeLocalizationV1(id: String) -> Request<GameCenterChallengeLocalizationImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations/\(id)/relationships/image",
            method: .get)
    }
}
