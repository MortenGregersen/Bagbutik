import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersions/{id}/relationships/alternativeDistributionPackage

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-alternativeDistributionPackage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionAlternativeDistributionPackageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/alternativeDistributionPackage",
            method: .get)
    }
}
