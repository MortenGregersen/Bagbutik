import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Clip Invocation for Testers in TestFlight
     Configure a new App Clip experience that testers launch using the TestFlight app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppClipInvocations>

     - Parameter requestBody: BetaAppClipInvocation representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppClipInvocationV1(requestBody: BetaAppClipInvocationCreateRequest) -> Request<BetaAppClipInvocationResponse, ErrorResponse> {
        .init(path: "/v1/betaAppClipInvocations", method: .post, requestBody: requestBody)
    }
}
