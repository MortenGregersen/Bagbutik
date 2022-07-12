public extension Request {
    /**
      # Modify a Beta Build Localization
      Update the localized What’s New text for a specific beta build and locale.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_build_localization>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: BetaBuildLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBetaBuildLocalizationV1(id: String,
                                              requestBody: BetaBuildLocalizationUpdateRequest) -> Request<BetaBuildLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaBuildLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
