public extension Request {
    /**
      # No overview available

      - Parameter requestBody: InAppPurchasePriceSchedule representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createInAppPurchasePriceScheduleV1(requestBody: InAppPurchasePriceScheduleCreateRequest) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchasePriceSchedules", method: .post, requestBody: requestBody)
    }
}
