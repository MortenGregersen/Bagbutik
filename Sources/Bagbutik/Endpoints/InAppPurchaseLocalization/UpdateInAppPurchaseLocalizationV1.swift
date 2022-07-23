public extension Request {
    /**
      # Modify an In-App Purchase Localization
      Update the display name and description for a specific locale of an in-app purchase.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_in-app_purchase_localization>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: InAppPurchaseLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateInAppPurchaseLocalizationV1(id: String,
                                                  requestBody: InAppPurchaseLocalizationUpdateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
