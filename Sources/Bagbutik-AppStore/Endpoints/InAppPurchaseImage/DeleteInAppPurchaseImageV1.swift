import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an in-app purchase image
     Delete the image asset that appears on the App Store listing that represents an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchaseImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseImages/\(id)",
            method: .delete)
    }
}
