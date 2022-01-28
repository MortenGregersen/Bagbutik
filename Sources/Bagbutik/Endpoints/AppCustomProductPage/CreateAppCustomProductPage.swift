public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpages>

      - Parameter requestBody: AppCustomProductPage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppCustomProductPage(requestBody: AppCustomProductPageCreateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse> {
        return .init(path: "/v1/appCustomProductPages", method: .post, requestBody: requestBody)
    }
}
