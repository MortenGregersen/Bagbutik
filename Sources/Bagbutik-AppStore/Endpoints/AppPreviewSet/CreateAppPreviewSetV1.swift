import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app preview set
     Add a new app preview set to an App Store version localization for a specific app preview type and display size.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appPreviewSets>

     - Parameter requestBody: AppPreviewSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppPreviewSetV1(requestBody: AppPreviewSetCreateRequest) -> Request<AppPreviewSetResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviewSets",
            method: .post,
            requestBody: requestBody)
    }
}
