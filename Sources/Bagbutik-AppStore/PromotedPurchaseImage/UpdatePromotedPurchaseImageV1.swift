import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit an Image for a Promoted Purchase
     Commit an uploaded image asset as a promoted in-app purchase image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-promotedPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: PromotedPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updatePromotedPurchaseImageV1(id: String,
                                              requestBody: PromotedPurchaseImageUpdateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse>
    {
        .init(path: "/v1/promotedPurchaseImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
