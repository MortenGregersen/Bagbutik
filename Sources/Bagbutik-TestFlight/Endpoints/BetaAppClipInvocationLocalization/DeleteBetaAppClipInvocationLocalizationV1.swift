import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Beta App Clip Invocation Localization
     Delete localized metadata you configured for an App Clip that testers launch using the TestFlight app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaAppClipInvocationLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaAppClipInvocationLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppClipInvocationLocalizations/\(id)",
            method: .delete)
    }
}
