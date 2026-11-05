import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a retention message localization

     Create a localization of the header and body text for a retention message version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
