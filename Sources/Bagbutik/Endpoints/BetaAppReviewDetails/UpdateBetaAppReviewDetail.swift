public extension Request {
    /**
      # Modify a Beta App Review Detail
      Update the details for a specific app's beta app review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_app_review_detail>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBetaAppReviewDetail(id: String,
                                          requestBody: BetaAppReviewDetailUpdateRequest) -> Request<BetaAppReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}
