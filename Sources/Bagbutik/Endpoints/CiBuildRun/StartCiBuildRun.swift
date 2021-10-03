public extension Request {
    /**
      # Start a Build
      Start a new Xcode Cloud build for a workflow.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/start_a_build>

      - Parameter requestBody: CiBuildRun representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func startCiBuildRun(requestBody: CiBuildRunCreateRequest) -> Request<CiBuildRunResponse, ErrorResponse> {
        return .init(path: "/v1/ciBuildRuns", method: .post, requestBody: requestBody)
    }
}
