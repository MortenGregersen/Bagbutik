import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a custom product page
     Add a custom product page for your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appCustomProductPages>

     - Parameter requestBody: AppCustomProductPage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageV1(requestBody: AppCustomProductPageCreateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPages",
            method: .post,
            requestBody: requestBody)
    }
}
