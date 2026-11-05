import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a retention message version

     Create a version of a retention message to submit to App Review.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
