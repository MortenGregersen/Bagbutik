import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Commit an Image for a Challenge

     Commit an uploaded image asset as a Game Center challenge image.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
