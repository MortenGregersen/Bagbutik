import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List app event screenshot IDs for an app event localization

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventLocalizations-_id_-relationships-appEventScreenshots>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEventScreenshotIdsForAppEventLocalizationV1(id: String,
                                                                   limit: Int? = nil) -> Request<AppEventLocalizationAppEventScreenshotsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)/relationships/appEventScreenshots",
            method: .get,
            parameters: .init(limit: limit))
    }
}
