import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a retention message localization

     Update the header and body text of a specific retention message localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-retentionMessageLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: RetentionMessageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRetentionMessageLocalizationV1(id: String,
                                                     requestBody: RetentionMessageLocalizationUpdateRequest) -> Request<RetentionMessageLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
