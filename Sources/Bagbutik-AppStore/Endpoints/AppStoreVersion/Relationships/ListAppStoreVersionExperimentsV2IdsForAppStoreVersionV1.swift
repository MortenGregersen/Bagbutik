import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersions/{id}/relationships/appStoreVersionExperimentsV2

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-appStoreVersionExperimentsV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionExperimentsV2IdsForAppStoreVersionV1(id: String,
                                                                        limit: Int? = nil) -> Request<AppStoreVersionAppStoreVersionExperimentsV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/appStoreVersionExperimentsV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}
