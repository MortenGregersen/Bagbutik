public extension Request {
    /**
      # PATCH /v1/appCustomProductPages/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appcustomproductpages_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppCustomProductPage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppCustomProductPageV1(id: String,
                                             requestBody: AppCustomProductPageUpdateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPages/\(id)", method: .patch, requestBody: requestBody)
    }
}
