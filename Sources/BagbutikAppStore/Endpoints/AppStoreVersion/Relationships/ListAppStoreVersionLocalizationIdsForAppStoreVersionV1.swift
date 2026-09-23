import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List App Store version localization IDs for an App Store version

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-appStoreVersionLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionLocalizationIdsForAppStoreVersionV1(id: String,
                                                                       limit: Int? = nil) -> Request<AppStoreVersionAppStoreVersionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/appStoreVersionLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
