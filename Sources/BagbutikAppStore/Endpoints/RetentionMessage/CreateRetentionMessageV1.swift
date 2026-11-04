import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-retentionMessages>

     - Parameter requestBody: RetentionMessage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionMessageV1(requestBody: RetentionMessageCreateRequest) -> Request<RetentionMessageResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessages",
            method: .post,
            requestBody: requestBody)
    }
}
