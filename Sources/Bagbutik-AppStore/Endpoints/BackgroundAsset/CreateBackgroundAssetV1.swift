import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create asset pack record
     Create an asset pack record for your Apple hosted background assets.

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
