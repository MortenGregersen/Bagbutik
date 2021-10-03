public extension Request {
    /**
      # Delete a Beta Group
      Delete a beta group and remove beta tester access to associated builds.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_group>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaGroup(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/betaGroups/\(id)", method: .delete)
    }
}
