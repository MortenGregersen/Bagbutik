public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: PromotedPurchase representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updatePromotedPurchase(id: String,
                                       requestBody: PromotedPurchaseUpdateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        return .init(path: "/v1/promotedPurchases/\(id)", method: .patch, requestBody: requestBody)
    }
}
