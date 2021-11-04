public extension Request {
    /**
      # Delete a Beta App Clip Invocation Localization
      Delete localized metadata you configured for an App Clip that testers launch using the TestFlight app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_app_clip_invocation_localization>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaAppClipInvocationLocalization(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/betaAppClipInvocationLocalizations/\(id)", method: .delete)
    }
}
