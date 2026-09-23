import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Modify a bundle id

     Update a specific bundle ID’s name.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-bundleIds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BundleId representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBundleIdV1(id: String,
                                 requestBody: BundleIdUpdateRequest) -> Request<BundleIdResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
