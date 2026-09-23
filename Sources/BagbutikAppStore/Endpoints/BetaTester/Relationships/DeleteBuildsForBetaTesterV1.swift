import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Individually unassign a beta tester from builds

     Remove an individually assigned beta tester’s ability to test a build.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaTesters-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBuildsForBetaTesterV1(id: String,
                                            requestBody: BetaTesterBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters/\(id)/relationships/builds",
            method: .delete,
            requestBody: requestBody)
    }
}
