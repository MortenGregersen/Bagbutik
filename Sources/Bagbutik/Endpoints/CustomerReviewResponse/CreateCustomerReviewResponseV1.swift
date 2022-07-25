public extension Request {
    /**
      # Create or Update a Response to a Customer Review
      Create a response or replace an existing response you wrote to a customer review.

      Use this endpoint to create a response to a customer review and publish it in the App Store. If a response already exists, this endpoint updates the response by overwriting it.
      Responses don’t appear in the App Store instantly. Allow some time for the App Store to publish the response.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_or_update_a_response_to_a_customer_review>

      - Parameter requestBody: CustomerReviewResponse representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCustomerReviewResponseV1(requestBody: CustomerReviewResponseV1CreateRequest) -> Request<CustomerReviewResponseV1Response, ErrorResponse> {
        return .init(path: "/v1/customerReviewResponses", method: .post, requestBody: requestBody)
    }
}
