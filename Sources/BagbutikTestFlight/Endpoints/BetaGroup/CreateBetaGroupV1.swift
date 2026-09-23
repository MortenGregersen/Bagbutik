import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create a beta group

     Create a beta group associated with an app, optionally enabling TestFlight public links.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaGroups>

     - Parameter requestBody: BetaGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaGroupV1(requestBody: BetaGroupCreateRequest) -> Request<BetaGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups",
            method: .post,
            requestBody: requestBody)
    }
}
