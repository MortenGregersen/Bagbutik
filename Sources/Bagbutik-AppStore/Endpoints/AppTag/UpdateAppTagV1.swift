import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify app tags
     Opt out of app tags for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appTags-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppTag representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppTagV1(id: String,
                               requestBody: AppTagUpdateRequest) -> Request<AppTagResponse, ErrorResponse> {
        .init(
            path: "/v1/appTags/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
