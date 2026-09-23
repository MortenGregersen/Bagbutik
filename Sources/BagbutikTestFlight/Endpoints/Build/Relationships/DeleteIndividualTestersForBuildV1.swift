import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Remove individual testers from a build

     Remove access to test a specific build from one or more individually assigned testers.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-builds-_id_-relationships-individualTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteIndividualTestersForBuildV1(id: String,
                                                  requestBody: BuildIndividualTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/individualTesters",
            method: .delete,
            requestBody: requestBody)
    }
}
