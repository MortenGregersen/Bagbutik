public extension Request {
    /**
      # Create a Beta Build Localization
      Create localized What’s New text for a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_build_localization>

      - Parameter requestBody: BetaBuildLocalization representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaBuildLocalizationV1(requestBody: BetaBuildLocalizationCreateRequest) -> Request<BetaBuildLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/betaBuildLocalizations", method: .post, requestBody: requestBody)
    }
}
