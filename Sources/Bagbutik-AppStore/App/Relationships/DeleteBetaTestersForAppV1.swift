import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Beta Testers from All Groups and Builds of an App
     Remove one or more beta testers' access to test any builds of a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_beta_testers_from_all_groups_and_builds_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaTestersForAppV1(id: String,
                                          requestBody: AppBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/relationships/betaTesters", method: .delete, requestBody: requestBody)
    }
}
