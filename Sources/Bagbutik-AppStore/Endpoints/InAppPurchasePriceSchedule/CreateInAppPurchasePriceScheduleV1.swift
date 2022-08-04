import Bagbutik_Core

public extension Request {
    /**
     # Add a Scheduled Price Change to an In-App Purchase
     Create a scheduled price change for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_a_scheduled_price_change_to_an_in-app_purchase>

     - Parameter requestBody: InAppPurchasePriceSchedule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchasePriceScheduleV1(requestBody: InAppPurchasePriceScheduleCreateRequest) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchasePriceSchedules", method: .post, requestBody: requestBody)
    }
}
