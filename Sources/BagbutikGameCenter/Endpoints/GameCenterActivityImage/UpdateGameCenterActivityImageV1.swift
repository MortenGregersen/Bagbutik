import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Commit an Image for an Activity

     Commit an uploaded image asset as a Game Center activity image.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
