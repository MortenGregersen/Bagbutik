import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a Reservation for a Build Upload File

     Reserve a build upload file for a specific build upload.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-buildUploadFiles>

     - Parameter requestBody: BuildUploadFile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildUploadFileV1(requestBody: BuildUploadFileCreateRequest) -> Request<BuildUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploadFiles",
            method: .post,
            requestBody: requestBody)
    }
}
