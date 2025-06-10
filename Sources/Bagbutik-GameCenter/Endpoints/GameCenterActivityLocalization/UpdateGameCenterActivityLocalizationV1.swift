import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an activity localization
     Update localization information for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivityLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivityLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityLocalizationV1(id: String,
                                                       requestBody: GameCenterActivityLocalizationUpdateRequest) -> Request<GameCenterActivityLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
