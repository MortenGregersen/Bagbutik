import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Info
     Update the App Store categories and sub-categories for your app.

     Use this endpoint to modify the primary and secondary categories and subcategories for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appInfos-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppInfo representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppInfoV1(id: String,
                                requestBody: AppInfoUpdateRequest) -> Request<AppInfoResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
