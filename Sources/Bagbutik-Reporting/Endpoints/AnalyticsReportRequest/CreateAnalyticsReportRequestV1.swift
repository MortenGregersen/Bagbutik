import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Request reports
     Request analytics reports for your apps.

     When making a request with this endpoint, the `accessType` `ONGOING` is most common and provides current data. This report request generates reports daily for each granularity: daily, weekly, and monthly. Use `ONE_TIME_SNAPSHOT` to get historical data.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-analyticsReportRequests>

     - Parameter requestBody: AnalyticsReportRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAnalyticsReportRequestV1(requestBody: AnalyticsReportRequestCreateRequest) -> Request<AnalyticsReportRequestResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportRequests",
            method: .post,
            requestBody: requestBody)
    }
}
