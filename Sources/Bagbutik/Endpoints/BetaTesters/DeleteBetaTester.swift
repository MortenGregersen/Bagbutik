public extension Request {
    /**
      # Delete a Beta Tester
      Remove a beta tester's ability to test all apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_tester>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaTester(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/betaTesters/\(id)", method: .delete)
    }
}
