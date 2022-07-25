public extension Request {
    /**
      # Delete an In-App Purchase Localization
      Delete the metadata for a single in-app purchase localization.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_in-app_purchase_localization>

      - Parameter id: The id of the requested resource
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchaseLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/inAppPurchaseLocalizations/\(id)", method: .delete)
    }
}
