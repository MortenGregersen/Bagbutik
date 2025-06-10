import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appInfos/{id}/relationships/primarySubcategoryTwo

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-primarySubcategoryTwo>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimarySubcategoryTwoIdsForAppInfoV1(id: String) -> Request<AppInfoPrimarySubcategoryTwoLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/primarySubcategoryTwo",
            method: .get)
    }
}
