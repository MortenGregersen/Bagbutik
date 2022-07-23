public extension Request {
    /**
      # Create an In-App Purchase Localization
      Create a localized display name and description for an in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_in-app_purchase_localization>

      - Parameter requestBody: InAppPurchaseLocalization representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseLocalizationV1(requestBody: InAppPurchaseLocalizationCreateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseLocalizations", method: .post, requestBody: requestBody)
    }
}
