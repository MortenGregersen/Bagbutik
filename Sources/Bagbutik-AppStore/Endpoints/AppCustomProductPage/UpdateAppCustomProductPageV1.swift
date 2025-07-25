import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an app custom product page
     Update the name and visibility status of an app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appCustomProductPages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageV1(id: String,
                                             requestBody: AppCustomProductPageUpdateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
