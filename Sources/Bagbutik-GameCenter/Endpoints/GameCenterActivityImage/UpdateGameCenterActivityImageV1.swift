import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit an image for an activity
     Commit an uploaded image asset as a Game Center activity image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivityImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivityImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityImageV1(id: String,
                                                requestBody: GameCenterActivityImageUpdateRequest) -> Request<GameCenterActivityImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
