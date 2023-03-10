import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a scheduled price change to an app
     Create a scheduled price change for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_a_scheduled_price_change_to_an_app>

     - Parameter requestBody: AppPriceSchedule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppPriceScheduleV1(requestBody: AppPriceScheduleCreateRequest) -> Request<AppPriceScheduleResponse, ErrorResponse> {
        .init(path: "/v1/appPriceSchedules", method: .post, requestBody: requestBody)
    }
}
