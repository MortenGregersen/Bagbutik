public extension Request {
    /**
      # Create a Promoted Purchase Image for an In-App Purchase
      Reserve an image asset to appear in the App Store, representing a promoted in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_promoted_purchase_image_for_an_in-app_purchase>

      - Parameter requestBody: PromotedPurchaseImage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createPromotedPurchaseImageV1(requestBody: PromotedPurchaseImageCreateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse> {
        return .init(path: "/v1/promotedPurchaseImages", method: .post, requestBody: requestBody)
    }
}
