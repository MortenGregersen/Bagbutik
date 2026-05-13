import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a Scheduled Price Change to an App
     Create a scheduled price change for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appPriceSchedules>

     - Parameter requestBody: AppPriceSchedule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppPriceScheduleV1(requestBody: AppPriceScheduleCreateRequest) -> Request<AppPriceScheduleResponse, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules",
            method: .post,
            requestBody: requestBody)
    }
}
