import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appEventVideoClips

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEventVideoClips>

     - Parameter requestBody: AppEventVideoClip representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventVideoClipV1(requestBody: AppEventVideoClipCreateRequest) -> Request<AppEventVideoClipResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventVideoClips",
            method: .post,
            requestBody: requestBody)
    }
}
