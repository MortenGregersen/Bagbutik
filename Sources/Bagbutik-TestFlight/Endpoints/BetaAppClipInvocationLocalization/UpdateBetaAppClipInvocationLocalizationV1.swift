import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify Localized Metadata of an App Clip Invocation for Testers
     Change the metadata for an App Clip you make available to testers in the TestFlight app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppClipInvocationLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppClipInvocationLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppClipInvocationLocalizationV1(id: String,
                                                          requestBody: BetaAppClipInvocationLocalizationUpdateRequest) -> Request<BetaAppClipInvocationLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppClipInvocationLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
