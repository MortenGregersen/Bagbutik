import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create a beta tester

     Create a beta tester assigned to a group, a build, or an app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaTesters>

     - Parameter requestBody: BetaTester representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaTesterV1(requestBody: BetaTesterCreateRequest) -> Request<BetaTesterResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters",
            method: .post,
            requestBody: requestBody)
    }
}
