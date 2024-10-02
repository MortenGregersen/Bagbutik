import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Clip Invocation for Testers in TestFlight
     Delete an App Clip invocation you make available to testers in TestFlight.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaAppClipInvocations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaAppClipInvocationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/betaAppClipInvocations/\(id)", method: .delete)
    }
}
