import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an alternative distribution key
     Add an alternative distribution key for your alternative marketplace app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_an_alternative_distribution_key>

     - Parameter requestBody: AlternativeDistributionKey representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAlternativeDistributionKeyV1(requestBody: AlternativeDistributionKeyCreateRequest) -> Request<AlternativeDistributionKeyResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionKeys", method: .post, requestBody: requestBody)
    }
}
