import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a nomination
     Update a specific featuring nomination.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-nominations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Nomination representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateNominationV1(id: String,
                                   requestBody: NominationUpdateRequest) -> Request<NominationResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
