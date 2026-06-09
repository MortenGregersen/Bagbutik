import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the subscription availability ID for an auto-renewable subscription

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-subscriptionAvailability>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getSubscriptionAvailabilityIdsForSubscriptionV1(id: String) -> Request<SubscriptionSubscriptionAvailabilityLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/subscriptionAvailability",
            method: .get)
    }
}
