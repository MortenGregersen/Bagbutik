import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the placement ID for a retention message version

     Get the image placement ID for a specific retention message version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessageVersions-_id_-relationships-placement>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPlacementIdsForRetentionMessageVersionV1(id: String) -> Request<RetentionMessageVersionPlacementLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageVersions/\(id)/relationships/placement",
            method: .get)
    }
}
