import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app preview
     Add a new app preview to a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appPreviews>

     - Parameter requestBody: AppPreview representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppPreviewV1(requestBody: AppPreviewCreateRequest) -> Request<AppPreviewResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviews",
            method: .post,
            requestBody: requestBody)
    }
}
