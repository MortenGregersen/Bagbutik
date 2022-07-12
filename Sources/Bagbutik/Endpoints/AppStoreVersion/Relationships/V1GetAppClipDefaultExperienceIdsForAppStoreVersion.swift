public extension Request {
    /**
      # Get the Default App Clip Experiences Resource ID for an App Store Version
      Get the ID of an app’s related default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_the_default_app_clip_experiences_resource_id_for_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipDefaultExperienceIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionAppClipDefaultExperienceLinkageResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersions/\(id)/relationships/appClipDefaultExperience", method: .get)
    }
}
