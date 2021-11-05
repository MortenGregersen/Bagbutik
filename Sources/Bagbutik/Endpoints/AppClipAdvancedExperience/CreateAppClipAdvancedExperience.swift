public extension Request {
    /**
      # Create an Advanced App Clip Experience
      Configure a new advanced App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_advanced_app_clip_experience>

      - Parameter requestBody: AppClipAdvancedExperience representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppClipAdvancedExperience(requestBody: AppClipAdvancedExperienceCreateRequest) -> Request<AppClipAdvancedExperienceResponse, ErrorResponse> {
        return .init(path: "/v1/appClipAdvancedExperiences", method: .post, requestBody: requestBody)
    }
}
