public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appeventlocalizations_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppEventLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppEventLocalization(id: String,
                                           requestBody: AppEventLocalizationUpdateRequest) -> Request<AppEventLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
