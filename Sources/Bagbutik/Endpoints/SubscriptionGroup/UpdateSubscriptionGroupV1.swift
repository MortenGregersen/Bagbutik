public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: SubscriptionGroup representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateSubscriptionGroupV1(id: String,
                                          requestBody: SubscriptionGroupUpdateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionGroups/\(id)", method: .patch, requestBody: requestBody)
    }
}
