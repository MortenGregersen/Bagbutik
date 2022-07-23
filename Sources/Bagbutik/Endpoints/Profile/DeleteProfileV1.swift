public extension Request {
    /**
      # Delete a Profile
      Delete a provisioning profile that is used for app development or distribution.

      You can delete provisioning profiles, and may wish to do so if they are expiring or obsolete.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_profile>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteProfileV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/profiles/\(id)", method: .delete)
    }
}
