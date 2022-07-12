public extension Request {
    /**
      # Delete an App Pre-Order
      Cancel a planned app pre-order that has not begun.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_pre-order>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppPreOrderV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appPreOrders/\(id)", method: .delete)
    }
}
