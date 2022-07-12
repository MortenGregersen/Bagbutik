public extension Request {
    /**
      # Delete an App Clip Invocation for Testers in TestFlight
      Delete an App Clip invocation you make available to testers in TestFlight.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_clip_invocation_for_testers_in_testflight>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaAppClipInvocationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/betaAppClipInvocations/\(id)", method: .delete)
    }
}
