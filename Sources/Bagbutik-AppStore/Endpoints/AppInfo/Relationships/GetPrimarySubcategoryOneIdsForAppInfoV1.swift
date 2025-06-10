import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appInfos/{id}/relationships/primarySubcategoryOne

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-primarySubcategoryOne>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimarySubcategoryOneIdsForAppInfoV1(id: String) -> Request<AppInfoPrimarySubcategoryOneLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/primarySubcategoryOne",
            method: .get)
    }
}
