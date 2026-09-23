import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Modify a beta group

     Modify a beta group’s metadata, including changing its TestFlight public link status.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaGroups-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaGroupV1(id: String,
                                  requestBody: BetaGroupUpdateRequest) -> Request<BetaGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
