import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an activity localization
     Add a localization for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivityLocalizations>

     - Parameter requestBody: GameCenterActivityLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityLocalizationV1(requestBody: GameCenterActivityLocalizationCreateRequest) -> Request<GameCenterActivityLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
