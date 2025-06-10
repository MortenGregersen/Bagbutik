import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an activity version
     Update a specific activity version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivityVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivityVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityVersionV1(id: String,
                                                  requestBody: GameCenterActivityVersionUpdateRequest) -> Request<GameCenterActivityVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
