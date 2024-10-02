import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create Localized Metadata for a Beta App Clip Invocation
     Provide localized metadata for an App Clip experience you make available to testers.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppClipInvocationLocalizations>

     - Parameter requestBody: BetaAppClipInvocationLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppClipInvocationLocalizationV1(requestBody: BetaAppClipInvocationLocalizationCreateRequest) -> Request<BetaAppClipInvocationLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/betaAppClipInvocationLocalizations", method: .post, requestBody: requestBody)
    }
}
