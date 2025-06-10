import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Beta Group
     Modify a beta group’s metadata, including changing its Testflight public link status.

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
