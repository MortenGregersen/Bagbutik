import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


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
