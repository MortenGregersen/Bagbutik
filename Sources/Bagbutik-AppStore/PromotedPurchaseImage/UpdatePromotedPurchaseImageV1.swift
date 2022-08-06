import Bagbutik_Models

public extension Request {
    /**
     # Commit an Image for a Promoted Purchase
     Commit an uploaded image asset as a promoted in-app purchase image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/commit_an_image_for_a_promoted_purchase>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: PromotedPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updatePromotedPurchaseImageV1(id: String,
                                              requestBody: PromotedPurchaseImageUpdateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse>
    {
        .init(path: "/v1/promotedPurchaseImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
