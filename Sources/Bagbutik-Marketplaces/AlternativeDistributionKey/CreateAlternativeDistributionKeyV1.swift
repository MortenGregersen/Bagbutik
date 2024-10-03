import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an alternative distribution key
     Add an alternative distribution key for your alternative marketplace app or web distribution.

     You can use a single alternative distribution key for all alternative distribution apps on your account. You can optionally use an app specific alternative distribution key, by adding a relationship to a specific app in the JSON payload used with this endpoint.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-alternativeDistributionKeys>

     - Parameter requestBody: AlternativeDistributionKey representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAlternativeDistributionKeyV1(requestBody: AlternativeDistributionKeyCreateRequest) -> Request<AlternativeDistributionKeyResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionKeys", method: .post, requestBody: requestBody)
    }
}
