public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionGracePeriod representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionGracePeriodV1(id: String,
                                                requestBody: SubscriptionGracePeriodUpdateRequest) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionGracePeriods/\(id)", method: .patch, requestBody: requestBody)
    }
}
