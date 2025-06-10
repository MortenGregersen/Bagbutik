import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the background asset upload files resource ID for a background asset version
     Get the ID for an uploaded asset pack Apple hosted background asset version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersions-_id_-relationships-backgroundAssetUploadFiles>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBackgroundAssetUploadFileIdsForBackgroundAssetVersionV1(id: String,
                                                                            limit: Int? = nil) -> Request<BackgroundAssetVersionBackgroundAssetUploadFilesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersions/\(id)/relationships/backgroundAssetUploadFiles",
            method: .get,
            parameters: .init(limit: limit))
    }
}
