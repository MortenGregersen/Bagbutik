import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Register a New Bundle ID
     Register a new bundle ID for app development.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-bundleIds>

     - Parameter requestBody: BundleId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBundleIdV1(requestBody: BundleIdCreateRequest) -> Request<BundleIdResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds",
            method: .post,
            requestBody: requestBody)
    }
}
