public extension Request {
    /**
     # Delete a Subscription
     Delete a specific auto-renewable subscription that you configured for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_subscription>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptions/\(id)", method: .delete)
    }
}
