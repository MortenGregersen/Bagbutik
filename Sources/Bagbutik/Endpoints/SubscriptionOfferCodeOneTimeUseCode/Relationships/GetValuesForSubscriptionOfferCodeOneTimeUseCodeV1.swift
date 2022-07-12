public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getValuesForSubscriptionOfferCodeOneTimeUseCodeV1(id: String) -> Request<Csv, ErrorResponse> {
        return .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)/values", method: .get)
    }
}
