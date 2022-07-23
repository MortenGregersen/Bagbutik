public extension Request {
    /**
      # Delete Prices from a Subscription
      Delete a scheduled subscription price change for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_prices_from_a_subscription>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deletePricesForSubscriptionV1(id: String,
                                              requestBody: SubscriptionPricesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptions/\(id)/relationships/prices", method: .delete, requestBody: requestBody)
    }
}
