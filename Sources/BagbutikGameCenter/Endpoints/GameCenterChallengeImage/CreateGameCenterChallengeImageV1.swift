import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Challenge Image

     Reserve an image for a Game Center challenge.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
