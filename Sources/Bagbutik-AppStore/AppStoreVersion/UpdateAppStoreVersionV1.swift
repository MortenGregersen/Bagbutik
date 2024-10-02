import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store Version
     Update the app store version for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionV1(id: String,
                                        requestBody: AppStoreVersionUpdateRequest) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)", method: .patch, requestBody: requestBody)
    }
}
