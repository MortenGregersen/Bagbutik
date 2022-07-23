public extension Request {
    /**
      # Delete an In-App Purchase
      Delete a specific in-app purchase from your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_in-app_purchase>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteInAppPurchaseV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v2/inAppPurchases/\(id)", method: .delete)
    }
}
