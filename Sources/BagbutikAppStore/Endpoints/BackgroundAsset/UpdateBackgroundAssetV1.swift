import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a Background Asset

     Update a specific background asset.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-backgroundAssets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BackgroundAsset representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBackgroundAssetV1(id: String,
                                        requestBody: BackgroundAssetUpdateRequest) -> Request<BackgroundAssetResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssets/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
