import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create asset pack version record
     Create an asset pack version record for your Apple-hosted background assets.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-backgroundAssetVersions>

     - Parameter requestBody: BackgroundAssetVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBackgroundAssetVersionV1(requestBody: BackgroundAssetVersionCreateRequest) -> Request<BackgroundAssetVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersions",
            method: .post,
            requestBody: requestBody)
    }
}
