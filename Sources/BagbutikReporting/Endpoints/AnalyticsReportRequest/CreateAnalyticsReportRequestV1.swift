import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Request Reports

     Request analytics reports for your apps.

     ## Discussion

     When making a request with this endpoint, the `accessType` `ONGOING` is most common and provides current data. This report request generates reports daily for each granularity: daily, weekly, and monthly. Use `ONE_TIME_SNAPSHOT` to get historical data.

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/analyticsReportRequests
     {
       "data": {
         "type": "analyticsReportRequests",
         "attributes": {
               "accessType": "ONGOING"
         },
         "relationships": {
           "app": {
             "data": {
               "type": "apps",
               "id": "1476097583"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "analyticsReportRequests",
         "id" : "d48c69c5-9bcb-4592-abbd-08a9411b0231",
         "attributes" : {
           "accessType" : "ONGOING",
           "stoppedDueToInactivity" : false
         },
         "relationships" : {
           "reports" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/reports",
               "related" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
