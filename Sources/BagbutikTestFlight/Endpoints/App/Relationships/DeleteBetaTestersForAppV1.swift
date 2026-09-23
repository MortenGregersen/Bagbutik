import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Remove specified beta testers from all groups and builds of an app

     Remove one or more beta testers’ access to test any builds of a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/1000001234/relationships/betaTesters -d
     "{
       "data": [
         {
           "type": "betaTesters",
           "id": "b6318884-4aa6-4586-bf0b-be97cf991817"
         }
       ]
     }
     "
     ```

     **Response:**

     ```json
     204 No Content
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-apps-_id_-relationships-betaTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaTestersForAppV1(id: String,
                                          requestBody: AppBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaTesters",
            method: .delete,
            requestBody: requestBody)
    }
}
