import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Register a new bundle id

     Register a new bundle ID for app development.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
