import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an app preview
     Commit the app preview after uploading it, and update the poster frame timecode.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appPreviews-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppPreview representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateAppPreviewV1(id: String,
                                   requestBody: AppPreviewUpdateRequest) -> Request<AppPreviewResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviews/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
