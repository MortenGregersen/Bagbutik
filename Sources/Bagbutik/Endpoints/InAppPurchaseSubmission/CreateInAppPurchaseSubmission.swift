public extension Request {
    /**
      # No overview available

      - Parameter requestBody: InAppPurchaseSubmission representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createInAppPurchaseSubmission(requestBody: InAppPurchaseSubmissionCreateRequest) -> Request<InAppPurchaseSubmissionResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseSubmissions", method: .post, requestBody: requestBody)
    }
}
