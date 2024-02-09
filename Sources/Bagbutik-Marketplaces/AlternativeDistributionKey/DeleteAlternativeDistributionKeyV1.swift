import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read alternative distribution key information
     Read the public key information for a specific alternative distribution key.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_alternative_distribution_key_information>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAlternativeDistributionKeyV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionKeys/\(id)", method: .delete)
    }
}
