public extension Request {
    /**
     # Create Localized Metadata for a Beta App Clip Invocation
     Provide localized metadata for an App Clip experience you make available to testers.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_localized_metadata_for_a_beta_app_clip_invocation>

     - Parameter requestBody: BetaAppClipInvocationLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppClipInvocationLocalizationV1(requestBody: BetaAppClipInvocationLocalizationCreateRequest) -> Request<BetaAppClipInvocationLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/betaAppClipInvocationLocalizations", method: .post, requestBody: requestBody)
    }
}
