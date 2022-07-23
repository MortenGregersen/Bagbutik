public extension Request {
    /**
      # POST /v1/appStoreVersionPromotions

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionpromotions>

      - Parameter requestBody: AppStoreVersionPromotion representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionPromotionV1(requestBody: AppStoreVersionPromotionCreateRequest) -> Request<AppStoreVersionPromotionResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionPromotions", method: .post, requestBody: requestBody)
    }
}
