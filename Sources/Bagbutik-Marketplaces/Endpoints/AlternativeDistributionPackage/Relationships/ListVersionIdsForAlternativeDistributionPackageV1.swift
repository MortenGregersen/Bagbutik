import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read version Ids for an alternative distribution package
     Get version IDs about a specific alternative distribution package.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackages-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForAlternativeDistributionPackageV1(id: String,
                                                                  limit: Int? = nil) -> Request<AlternativeDistributionPackageVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackages/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
