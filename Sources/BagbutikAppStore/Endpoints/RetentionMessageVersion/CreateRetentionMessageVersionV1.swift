import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-retentionMessageVersions>

     - Parameter requestBody: RetentionMessageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionMessageVersionV1(requestBody: RetentionMessageVersionCreateRequest) -> Request<RetentionMessageVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageVersions",
            method: .post,
            requestBody: requestBody)
    }
}
