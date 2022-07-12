public extension Request {
    /**
      # No overview available

      - Parameter requestBody: InAppPurchase representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createInAppPurchaseV2(requestBody: InAppPurchaseV2CreateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse> {
        return .init(path: "/v2/inAppPurchases", method: .post, requestBody: requestBody)
    }
}
