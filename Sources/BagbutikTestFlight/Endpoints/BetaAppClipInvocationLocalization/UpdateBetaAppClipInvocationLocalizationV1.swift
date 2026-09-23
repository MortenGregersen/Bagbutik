import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Modify localized metadata of an app clip invocation for testers

     Change the metadata for an App Clip you make available to testers in the TestFlight app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
