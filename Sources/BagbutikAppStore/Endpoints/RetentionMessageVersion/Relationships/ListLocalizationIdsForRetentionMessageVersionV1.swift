import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List localization IDs for a retention message version

     Get a list of localization IDs for a specific retention message version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessageVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForRetentionMessageVersionV1(id: String,
                                                                limit: Int? = nil) -> Request<RetentionMessageVersionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
