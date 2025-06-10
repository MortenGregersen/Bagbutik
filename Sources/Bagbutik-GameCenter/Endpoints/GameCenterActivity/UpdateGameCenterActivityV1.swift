import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an activity
     Update details for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivity representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityV1(id: String,
                                           requestBody: GameCenterActivityUpdateRequest) -> Request<GameCenterActivityResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
