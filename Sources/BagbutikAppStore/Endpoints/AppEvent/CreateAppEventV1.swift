import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app event

     Create a new in-app event for your app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEvents>

     - Parameter requestBody: AppEvent representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventV1(requestBody: AppEventCreateRequest) -> Request<AppEventResponse, ErrorResponse> {
        .init(
            path: "/v1/appEvents",
            method: .post,
            requestBody: requestBody)
    }
}
