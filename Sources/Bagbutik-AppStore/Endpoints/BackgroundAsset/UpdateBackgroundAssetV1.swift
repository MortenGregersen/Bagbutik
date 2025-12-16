import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a background asset
     Update a specific background asset.

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
