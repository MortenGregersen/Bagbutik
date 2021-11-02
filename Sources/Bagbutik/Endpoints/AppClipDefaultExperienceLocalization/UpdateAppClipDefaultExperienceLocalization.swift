public extension Request {
    /**
      # Modify the Localization for a Default App Clip Experience
      Update localized metadata for a specific default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_localization_for_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppClipDefaultExperienceLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppClipDefaultExperienceLocalization(id: String,
                                                           requestBody: AppClipDefaultExperienceLocalizationUpdateRequest) -> Request<AppClipDefaultExperienceLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperienceLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
