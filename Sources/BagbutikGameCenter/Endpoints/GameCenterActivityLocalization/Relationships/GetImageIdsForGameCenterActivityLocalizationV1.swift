import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get the image ID for a Game Center activity localization

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterActivityLocalizationV1(id: String) -> Request<GameCenterActivityLocalizationImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)/relationships/image",
            method: .get)
    }
}
