public extension Request {
    /**
      # No overview available

      - Parameter requestBody: InAppPurchaseLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createInAppPurchaseLocalization(requestBody: InAppPurchaseLocalizationCreateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseLocalizations", method: .post, requestBody: requestBody)
    }
}
