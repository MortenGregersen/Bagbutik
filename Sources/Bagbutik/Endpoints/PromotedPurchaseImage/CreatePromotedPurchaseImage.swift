public extension Request {
    /**
      # No overview available

      - Parameter requestBody: PromotedPurchaseImage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createPromotedPurchaseImage(requestBody: PromotedPurchaseImageCreateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse> {
        return .init(path: "/v1/promotedPurchaseImages", method: .post, requestBody: requestBody)
    }
}
