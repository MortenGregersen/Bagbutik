import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Clip Invocation You Provide to Testers
     Change an App Clip invocation you make available to testers in the TestFlight app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppClipInvocations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppClipInvocation representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppClipInvocationV1(id: String,
                                              requestBody: BetaAppClipInvocationUpdateRequest) -> Request<BetaAppClipInvocationResponse, ErrorResponse>
    {
        .init(path: "/v1/betaAppClipInvocations/\(id)", method: .patch, requestBody: requestBody)
    }
}
