import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an activity image
     Reserve an image for a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivityImages>

     - Parameter requestBody: GameCenterActivityImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityImageV1(requestBody: GameCenterActivityImageCreateRequest) -> Request<GameCenterActivityImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityImages",
            method: .post,
            requestBody: requestBody)
    }
}
