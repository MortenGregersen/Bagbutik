public extension Request {
    /**
      # Modify the Related App Store Version for a Default App Clip Experience
      Update the relationship between a default App Clip experience and an App Store Version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_related_app_store_version_for_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: Related linkage
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateReleaseWithAppStoreVersionForAppClipDefaultExperienceV1(id: String,
                                                                              requestBody: AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)/relationships/releaseWithAppStoreVersion", method: .patch, requestBody: requestBody)
    }
}
