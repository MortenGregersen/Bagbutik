import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a challenge image
     Reserve an image for a Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeImages>

     - Parameter requestBody: GameCenterChallengeImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeImageV1(requestBody: GameCenterChallengeImageCreateRequest) -> Request<GameCenterChallengeImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeImages",
            method: .post,
            requestBody: requestBody)
    }
}
