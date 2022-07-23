public extension Request {
    /**
      # Create Custom Offer Codes
      Create custom offer codes for an auto-renewable subscription offer.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_custom_offer_codes>

      - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createSubscriptionOfferCodeCustomCodeV1(requestBody: SubscriptionOfferCodeCustomCodeCreateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        return .init(path: "/v1/subscriptionOfferCodeCustomCodes", method: .post, requestBody: requestBody)
    }
}
