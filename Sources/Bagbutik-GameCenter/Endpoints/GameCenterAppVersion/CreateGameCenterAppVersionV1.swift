import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app version
     Add a new Game Center app version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAppVersions>

     - Parameter requestBody: GameCenterAppVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterAppVersionV1(requestBody: GameCenterAppVersionCreateRequest) -> Request<GameCenterAppVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAppVersions",
            method: .post,
            requestBody: requestBody)
    }
}
