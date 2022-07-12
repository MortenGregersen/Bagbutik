public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: InAppPurchaseLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateInAppPurchaseLocalization(id: String,
                                                requestBody: InAppPurchaseLocalizationUpdateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
