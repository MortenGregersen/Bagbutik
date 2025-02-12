import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a custom product page version
     Add a version for your app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appCustomProductPageVersions>

     - Parameter requestBody: AppCustomProductPageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageVersionV1(requestBody: AppCustomProductPageVersionCreateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPageVersions", method: .post, requestBody: requestBody)
    }
}
