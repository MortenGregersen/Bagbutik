import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an in-app purchase image
     Commit the asset upload for an in-app purchase image configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseImagesV2(id: String,
                                            requestBody: InAppPurchaseImageV2UpdateRequest) -> Request<InAppPurchaseImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
