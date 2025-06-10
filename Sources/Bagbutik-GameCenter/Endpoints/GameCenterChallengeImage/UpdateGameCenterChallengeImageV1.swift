import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit an image for a challenge
     Commit an uploaded image asset as a Game Center challenge image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallengeImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterChallengeImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterChallengeImageV1(id: String,
                                                 requestBody: GameCenterChallengeImageUpdateRequest) -> Request<GameCenterChallengeImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
