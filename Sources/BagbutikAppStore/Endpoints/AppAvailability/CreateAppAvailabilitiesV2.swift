import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app pre-order

     Create an app pre-order and set the expected app release date.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-appAvailabilities>

     - Parameter requestBody: AppAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppAvailabilitiesV2(requestBody: AppAvailabilityV2CreateRequest) -> Request<AppAvailabilityV2Response, ErrorResponse> {
        .init(
            path: "/v2/appAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
