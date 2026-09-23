import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create an app version

     Add a new Game Center app version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
