import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Clip Card Image
     Change the image that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipHeaderImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipHeaderImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipHeaderImageV1(id: String,
                                           requestBody: AppClipHeaderImageUpdateRequest) -> Request<AppClipHeaderImageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipHeaderImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
