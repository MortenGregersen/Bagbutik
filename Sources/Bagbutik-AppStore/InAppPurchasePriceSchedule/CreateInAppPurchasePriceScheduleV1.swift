import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a scheduled price change to an in-app purchase
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
