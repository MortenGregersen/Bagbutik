import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Reservation for an Asset Pack Upload
     Begin the process of uploading an asset pack for Apple-hosted background assets.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-backgroundAssetUploadFiles>

     - Parameter requestBody: BackgroundAssetUploadFile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBackgroundAssetUploadFileV1(requestBody: BackgroundAssetUploadFileCreateRequest) -> Request<BackgroundAssetUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetUploadFiles",
            method: .post,
            requestBody: requestBody)
    }
}
