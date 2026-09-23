import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read Usage Metrics for a Beta Build

     Get usage metrics for a specific build.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/builds/ace4f47a-60ae-4ed6-954f-c4e61c7baab0/metrics/betaBuildUsages
     ```

     **Response:**

     ```json
     {
       “data”: [
         {
           “type”: “betaBuildUsages”,
           “dataPoints”: [
             {
               “start”: “2022-10-05”,
               “end”: “2023-10-05”,
               “values”: {
                 “installCount”: 2,
                 “crashCount”: 0,
                 “sessionCount”: 0,
                 “inviteCount”: 0,
                 “feedbackCount”: 0
               }
             }
           ]
         }
       ],
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/builds/ace4f47a-60ae-4ed6-954f-c4e61c7baab0/metrics/betaBuildUsages”
       },
       “meta”: {
         “paging”: {
           “total”: 1,
           “limit”: 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-metrics-betaBuildUsages>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaBuildUsageInBuildV1(id: String,
                                                     limit: Int? = nil) -> Request<BetaBuildUsagesV1MetricResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/metrics/betaBuildUsages",
            method: .get,
            parameters: .init(limit: limit))
    }
}
