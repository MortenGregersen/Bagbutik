import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List localization IDs for an In-App Purchase version

     Get the related resource IDs for the localizations captured in a draft version of an In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForInAppPurchaseVersionV1(id: String,
                                                             limit: Int? = nil) -> Request<InAppPurchaseVersionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
