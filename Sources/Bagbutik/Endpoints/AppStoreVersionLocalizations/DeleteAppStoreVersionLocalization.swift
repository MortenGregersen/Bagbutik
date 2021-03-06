public extension Request {
    /**
      # Delete an App Store Version Localization
      Delete a language from your version metadata.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_version_localization>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppStoreVersionLocalization(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionLocalizations/\(id)", method: .delete)
    }
}
