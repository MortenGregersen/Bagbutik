public extension Request {
    /**
      # Create a Beta Tester
      Create a beta tester assigned to a group, a build, or an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_tester>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaTester(requestBody: BetaTesterCreateRequest) -> Request<BetaTesterResponse, ErrorResponse> {
        return .init(path: "/v1/betaTesters", method: .post, requestBody: requestBody)
    }
}
