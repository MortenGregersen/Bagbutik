public extension Request {
    /**
      # Delete an App Info Localization
      Delete an app information localization that is associated with an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_info_localization>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppInfoLocalization(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appInfoLocalizations/\(id)", method: .delete)
    }
}
