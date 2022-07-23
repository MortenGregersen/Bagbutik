public extension Request {
    /**
      # Modify a Promoted In-App Purchase
      Update the visibility of a promoted in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_promoted_in-app_purchase>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: PromotedPurchase representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updatePromotedPurchaseV1(id: String,
                                         requestBody: PromotedPurchaseUpdateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        return .init(path: "/v1/promotedPurchases/\(id)", method: .patch, requestBody: requestBody)
    }
}
