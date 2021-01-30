public extension Request {
    /**
      # Add Access for Beta Groups to a Build
      Add or create a beta group to a build to enable testing.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_access_for_beta_groups_to_a_build>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaGroupsForBuild(id: String,
                                         requestBody: BuildBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/relationships/betaGroups", method: .post, requestBody: requestBody)
    }
}
