import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the resource IDs of the localizations of a subscription group version
     Get the related resource IDs for the localizations captured in a draft version of a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGroupVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForSubscriptionGroupVersionV1(id: String,
                                                                 limit: Int? = nil) -> Request<SubscriptionGroupVersionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
