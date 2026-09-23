import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create Asset Pack Record

     Create an asset pack record for your Apple-hosted background assets.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-backgroundAssets>

     - Parameter requestBody: BackgroundAsset representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBackgroundAssetV1(requestBody: BackgroundAssetCreateRequest) -> Request<BackgroundAssetResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssets",
            method: .post,
            requestBody: requestBody)
    }
}
