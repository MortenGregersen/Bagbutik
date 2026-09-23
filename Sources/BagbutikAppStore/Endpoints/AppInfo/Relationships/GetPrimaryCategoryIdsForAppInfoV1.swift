import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the primary category ID for an app info

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-primaryCategory>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimaryCategoryIdsForAppInfoV1(id: String) -> Request<AppInfoPrimaryCategoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/primaryCategory",
            method: .get)
    }
}
