import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Add a Scheduled Price Change to an In-App Purchase

     Create a scheduled price change for an In-App Purchase.

     ## Discussion

     > Note:
     > A base territory is now required when adding or creating a price for an In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchasePriceSchedules>

     - Parameter requestBody: InAppPurchasePriceSchedule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchasePriceScheduleV1(requestBody: InAppPurchasePriceScheduleCreateRequest) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules",
            method: .post,
            requestBody: requestBody)
    }
}
