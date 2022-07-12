public extension Request {
    /**
      # Create an App Clip Invocation for Testers in TestFlight
      Configure a new App Clip experience that testers launch using the TestFlight app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_clip_invocation_for_testers_in_testflight>

      - Parameter requestBody: BetaAppClipInvocation representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaAppClipInvocationV1(requestBody: BetaAppClipInvocationCreateRequest) -> Request<BetaAppClipInvocationResponse, ErrorResponse> {
        return .init(path: "/v1/betaAppClipInvocations", method: .post, requestBody: requestBody)
    }
}
