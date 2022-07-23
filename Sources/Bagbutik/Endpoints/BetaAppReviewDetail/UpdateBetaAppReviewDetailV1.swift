public extension Request {
    /**
      # Modify a Beta App Review Detail
      Update the details for a specific app's beta app review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_app_review_detail>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: BetaAppReviewDetail representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppReviewDetailV1(id: String,
                                            requestBody: BetaAppReviewDetailUpdateRequest) -> Request<BetaAppReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}
