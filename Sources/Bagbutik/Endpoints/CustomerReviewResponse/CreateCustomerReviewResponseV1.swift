public extension Request {
    /**
      # No overview available

      - Parameter requestBody: CustomerReviewResponse representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createCustomerReviewResponseV1(requestBody: CustomerReviewResponseV1CreateRequest) -> Request<CustomerReviewResponseV1Response, ErrorResponse> {
        return .init(path: "/v1/customerReviewResponses", method: .post, requestBody: requestBody)
    }
}
