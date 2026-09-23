import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a Custom Product Page Version

     Add a version for your app custom product page.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appCustomProductPageVersions>

     - Parameter requestBody: AppCustomProductPageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageVersionV1(requestBody: AppCustomProductPageVersionCreateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageVersions",
            method: .post,
            requestBody: requestBody)
    }
}
