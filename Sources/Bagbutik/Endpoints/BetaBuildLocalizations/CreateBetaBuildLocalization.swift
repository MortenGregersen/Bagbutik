public extension Request {
    /**
      # Create a Beta Build Localization
      Create localized What’s New text for a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_build_localization>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaBuildLocalization(requestBody: BetaBuildLocalizationCreateRequest) -> Request<BetaBuildLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/betaBuildLocalizations", method: .post, requestBody: requestBody)
    }
}
