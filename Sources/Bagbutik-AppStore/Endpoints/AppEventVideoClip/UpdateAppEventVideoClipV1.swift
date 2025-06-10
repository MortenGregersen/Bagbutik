import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/appEventVideoClips/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEventVideoClips-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEventVideoClip representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEventVideoClipV1(id: String,
                                          requestBody: AppEventVideoClipUpdateRequest) -> Request<AppEventVideoClipResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventVideoClips/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
