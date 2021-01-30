public extension Request {
    /**
      # Delete an App Store Version
      Delete an app store version that is associated with an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppStoreVersion(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersions/\(id)", method: .delete)
    }
}
