import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app event video clip
     Reserve a video clip asset for an in-app event.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEventVideoClips>

     - Parameter requestBody: AppEventVideoClip representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppEventVideoClipV1(requestBody: AppEventVideoClipCreateRequest) -> Request<AppEventVideoClipResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventVideoClips",
            method: .post,
            requestBody: requestBody)
    }
}
