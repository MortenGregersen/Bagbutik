import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create an Activity Image

     Reserve an image for a Game Center activity.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
