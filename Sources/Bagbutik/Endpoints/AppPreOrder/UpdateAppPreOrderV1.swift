public extension Request {
    /**
      # Modify an App Pre-Order
      Update the release date for your app pre-order.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_pre-order>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppPreOrder representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppPreOrderV1(id: String,
                                    requestBody: AppPreOrderUpdateRequest) -> Request<AppPreOrderResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreOrders/\(id)", method: .patch, requestBody: requestBody)
    }
}
