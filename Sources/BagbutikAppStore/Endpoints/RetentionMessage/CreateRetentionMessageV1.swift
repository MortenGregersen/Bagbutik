import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a retention message

     Create a retention message for an app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
