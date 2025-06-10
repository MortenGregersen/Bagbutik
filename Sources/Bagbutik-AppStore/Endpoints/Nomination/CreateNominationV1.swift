import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a featuring nomination
     Tell Apple about your upcoming app or feature.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-nominations>

     - Parameter requestBody: Nomination representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createNominationV1(requestBody: NominationCreateRequest) -> Request<NominationResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations",
            method: .post,
            requestBody: requestBody)
    }
}
