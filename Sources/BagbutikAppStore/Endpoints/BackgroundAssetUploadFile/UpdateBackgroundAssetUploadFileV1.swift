import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Commit an Uploaded Asset Pack to a Background Asset Version

     Associate an uploaded asset pack with a background asset version to finish the upload process.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
