import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App
     Update app information, including bundle ID, primary locale, price schedule, and global availability.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: App representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppV1(id: String,
                            requestBody: AppUpdateRequest) -> Request<AppResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)", method: .patch, requestBody: requestBody)
    }
}
