import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove an alternative distribution key
     Remove an alternative distribution key from your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-alternativeDistributionKeys-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAlternativeDistributionKeyV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionKeys/\(id)", method: .delete)
    }
}
