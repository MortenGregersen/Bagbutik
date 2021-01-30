public extension Request {
    /**
      # Delete a Profile
      Delete a provisioning profile that is used for app development or distribution.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_profile>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteProfile(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/profiles/\(id)", method: .delete)
    }
}
