import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Promoted Purchase Image
     Delete the image asset that appears on the App Store listing that represents a promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-promotedPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deletePromotedPurchaseImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/promotedPurchaseImages/\(id)", method: .delete)
    }
}
