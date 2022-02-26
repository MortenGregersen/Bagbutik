public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionpromotions>

      - Parameter requestBody: AppStoreVersionPromotion representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionPromotion(requestBody: AppStoreVersionPromotionCreateRequest) -> Request<AppStoreVersionPromotionResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionPromotions", method: .post, requestBody: requestBody)
    }
}
