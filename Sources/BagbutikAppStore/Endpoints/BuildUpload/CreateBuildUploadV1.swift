import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a Build Upload

     Add a new build upload to an app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-buildUploads>

     - Parameter requestBody: BuildUpload representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildUploadV1(requestBody: BuildUploadCreateRequest) -> Request<BuildUploadResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploads",
            method: .post,
            requestBody: requestBody)
    }
}
