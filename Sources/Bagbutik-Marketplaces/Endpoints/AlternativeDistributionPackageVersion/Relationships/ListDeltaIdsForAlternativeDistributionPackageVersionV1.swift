import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List delta Ids
     List all delta Ids for a specific alternative distribution package version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVersions-_id_-relationships-deltas>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDeltaIdsForAlternativeDistributionPackageVersionV1(id: String,
                                                                       limit: Int? = nil) -> Request<AlternativeDistributionPackageVersionDeltasLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageVersions/\(id)/relationships/deltas",
            method: .get,
            parameters: .init(limit: limit))
    }
}
