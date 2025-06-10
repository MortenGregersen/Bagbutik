import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase image information
     Read details about a specific in-app purchase image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseImageV1(id: String,
                                           requestBody: InAppPurchaseImageUpdateRequest) -> Request<InAppPurchaseImageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
