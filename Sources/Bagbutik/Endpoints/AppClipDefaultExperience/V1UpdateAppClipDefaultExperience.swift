public extension Request {
    /**
      # Modify a Default App Clip Experience
      Update a default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppClipDefaultExperience representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppClipDefaultExperienceV1(id: String,
                                                 requestBody: AppClipDefaultExperienceUpdateRequest) -> Request<AppClipDefaultExperienceResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)", method: .patch, requestBody: requestBody)
    }
}
