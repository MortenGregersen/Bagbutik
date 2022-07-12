public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: Subscription representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscription(id: String,
                                   requestBody: SubscriptionUpdateRequest) -> Request<SubscriptionResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptions/\(id)", method: .patch, requestBody: requestBody)
    }
}
