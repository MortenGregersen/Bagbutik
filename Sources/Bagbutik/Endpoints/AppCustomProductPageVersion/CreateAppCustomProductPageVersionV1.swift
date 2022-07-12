public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpageversions>

      - Parameter requestBody: AppCustomProductPageVersion representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppCustomProductPageVersionV1(requestBody: AppCustomProductPageVersionCreateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse> {
        return .init(path: "/v1/appCustomProductPageVersions", method: .post, requestBody: requestBody)
    }
}
