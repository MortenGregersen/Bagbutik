import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-retentionMessageLocalizations>

     - Parameter requestBody: RetentionMessageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionMessageLocalizationV1(requestBody: RetentionMessageLocalizationCreateRequest) -> Request<RetentionMessageLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
