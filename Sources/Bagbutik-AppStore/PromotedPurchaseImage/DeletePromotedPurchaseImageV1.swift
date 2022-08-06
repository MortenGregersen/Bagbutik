import Bagbutik_Models

public extension Request {
    /**
     # Delete a Promoted Purchase Image
     Delete the image asset that appears on the App Store listing that represents a promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_promoted_purchase_image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deletePromotedPurchaseImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/promotedPurchaseImages/\(id)", method: .delete)
    }
}
