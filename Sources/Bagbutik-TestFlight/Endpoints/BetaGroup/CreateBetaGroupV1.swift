import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Beta Group
     Create a beta group associated with an app, optionally enabling TestFlight public links.

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
