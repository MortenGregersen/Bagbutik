public extension Request {
    /**
      # Individually Unassign a Beta Tester from Builds
      Remove an individually assigned beta tester's ability to test a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/individually_unassign_a_beta_tester_from_builds>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBuildsForBetaTester(id: String,
                                          requestBody: BetaTesterBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/relationships/builds", method: .delete, requestBody: requestBody)
    }
}
