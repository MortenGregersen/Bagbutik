public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: PromotedPurchaseImage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updatePromotedPurchaseImageV1(id: String,
                                              requestBody: PromotedPurchaseImageUpdateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse>
    {
        return .init(path: "/v1/promotedPurchaseImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
