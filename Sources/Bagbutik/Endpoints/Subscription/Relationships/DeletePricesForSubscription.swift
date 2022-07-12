public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deletePricesForSubscription(id: String,
                                            requestBody: SubscriptionPricesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptions/\(id)/relationships/prices", method: .delete, requestBody: requestBody)
    }
}
