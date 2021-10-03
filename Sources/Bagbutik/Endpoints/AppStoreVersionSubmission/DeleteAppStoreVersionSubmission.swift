public extension Request {
    /**
      # Delete an App Store Version Submission
      Remove a version from App Store review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_version_submission>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppStoreVersionSubmission(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionSubmissions/\(id)", method: .delete)
    }
}
