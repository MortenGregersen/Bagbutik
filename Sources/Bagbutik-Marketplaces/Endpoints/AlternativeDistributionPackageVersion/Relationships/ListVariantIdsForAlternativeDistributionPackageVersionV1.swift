import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List variant Ids information
     List variant Ids for specific alternative distribution package version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVersions-_id_-relationships-variants>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVariantIdsForAlternativeDistributionPackageVersionV1(id: String,
                                                                         limit: Int? = nil) -> Request<AlternativeDistributionPackageVersionVariantsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageVersions/\(id)/relationships/variants",
            method: .get,
            parameters: .init(limit: limit))
    }
}
