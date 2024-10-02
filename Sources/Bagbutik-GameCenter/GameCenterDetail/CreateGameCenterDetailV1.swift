import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Enable Game Center for an app
     Create a Game Center detail for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterDetails>

     - Parameter requestBody: GameCenterDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterDetailV1(requestBody: GameCenterDetailCreateRequest) -> Request<GameCenterDetailResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterDetails", method: .post, requestBody: requestBody)
    }
}
