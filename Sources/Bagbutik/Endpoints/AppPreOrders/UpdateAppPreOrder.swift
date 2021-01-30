public extension Request {
    /**
      # Modify an App Pre-Order
      Update the release date for your app pre-order.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_pre-order>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppPreOrder(id: String,
                                  requestBody: AppPreOrderUpdateRequest) -> Request<AppPreOrderResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreOrders/\(id)", method: .patch, requestBody: requestBody)
    }
}
