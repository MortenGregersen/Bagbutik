import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Add an Activity Localization

     Add a localization for a specific Game Center activity.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivityLocalizations>

     - Parameter requestBody: GameCenterActivityLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityLocalizationV1(requestBody: GameCenterActivityLocalizationCreateRequest) -> Request<GameCenterActivityLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
