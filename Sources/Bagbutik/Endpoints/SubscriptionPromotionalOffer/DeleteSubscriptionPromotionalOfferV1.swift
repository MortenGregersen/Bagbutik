public extension Request {
    /**
      # Delete a Promotional Offer from a Subscription
      Delete a specific promotional offer from an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_promotional_offer_from_a_subscription>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteSubscriptionPromotionalOfferV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionPromotionalOffers/\(id)", method: .delete)
    }
}
