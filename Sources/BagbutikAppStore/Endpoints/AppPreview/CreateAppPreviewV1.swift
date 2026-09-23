import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app preview

     Add a new app preview to a preview set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appPreviews>

     - Parameter requestBody: AppPreview representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppPreviewV1(requestBody: AppPreviewCreateRequest) -> Request<AppPreviewResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviews",
            method: .post,
            requestBody: requestBody)
    }
}
