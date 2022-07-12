public extension Request {
    /**
      # Delete a Default App Clip Experience
      Delete a specific default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppClipDefaultExperienceV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)", method: .delete)
    }
}
