import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the routing app coverage ID for an App Store version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-routingAppCoverage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRoutingAppCoverageIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionRoutingAppCoverageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/routingAppCoverage",
            method: .get)
    }
}
