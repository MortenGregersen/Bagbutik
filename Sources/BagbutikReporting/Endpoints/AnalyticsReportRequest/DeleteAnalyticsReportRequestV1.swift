import BagbutikCore
import BagbutikModelsShared
import BagbutikReportingModels

public extension Request {
    /**
     # Delete a Report Request

     Remove a specific analytics report request.

     ## Discussion

     ### Examples Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231
     ```

     **Response:**

     ```json
     204 No Content
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-analyticsReportRequests-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAnalyticsReportRequestV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportRequests/\(id)",
            method: .delete)
    }
}
