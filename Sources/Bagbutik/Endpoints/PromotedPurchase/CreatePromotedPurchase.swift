public extension Request {
    /**
      # No overview available

      - Parameter requestBody: PromotedPurchase representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createPromotedPurchase(requestBody: PromotedPurchaseCreateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse> {
        return .init(path: "/v1/promotedPurchases", method: .post, requestBody: requestBody)
    }
}
