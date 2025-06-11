import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appInfos/{id}/relationships/primaryCategory

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-primaryCategory>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimaryCategoryIdsForAppInfoV1(id: String) -> Request<AppInfoPrimaryCategoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/primaryCategory",
            method: .get)
    }
}
