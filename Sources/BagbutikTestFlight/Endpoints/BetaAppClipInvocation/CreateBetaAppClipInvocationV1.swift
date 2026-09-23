import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create an app clip invocation for testers in testflight

     Configure a new App Clip experience that testers launch using the TestFlight app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppClipInvocations>

     - Parameter requestBody: BetaAppClipInvocation representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppClipInvocationV1(requestBody: BetaAppClipInvocationCreateRequest) -> Request<BetaAppClipInvocationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppClipInvocations",
            method: .post,
            requestBody: requestBody)
    }
}
