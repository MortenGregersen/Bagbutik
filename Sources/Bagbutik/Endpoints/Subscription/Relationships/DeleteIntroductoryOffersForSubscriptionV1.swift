public extension Request {
    /**
     # Delete an Introductory Offer from a Subscription
     Delete a specific introductory offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_introductory_offer_from_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteIntroductoryOffersForSubscriptionV1(id: String,
                                                          requestBody: SubscriptionIntroductoryOffersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/relationships/introductoryOffers", method: .delete, requestBody: requestBody)
    }
}
