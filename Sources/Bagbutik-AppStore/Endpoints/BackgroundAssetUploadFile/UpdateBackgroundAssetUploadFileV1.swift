import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit an uploaded asset pack to a background asset version
     Associate an uploaded asset pack with a background asset version to finish the upload process.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-backgroundAssetUploadFiles-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BackgroundAssetUploadFile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBackgroundAssetUploadFileV1(id: String,
                                                  requestBody: BackgroundAssetUploadFileUpdateRequest) -> Request<BackgroundAssetUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetUploadFiles/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
