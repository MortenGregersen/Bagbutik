public extension Request {
    /**
     # Create an App Pre-Order
     Turn on pre-order and set the expected app release date.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_pre-order>

     - Parameter requestBody: AppPreOrder representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppPreOrderV1(requestBody: AppPreOrderCreateRequest) -> Request<AppPreOrderResponse, ErrorResponse> {
        .init(path: "/v1/appPreOrders", method: .post, requestBody: requestBody)
    }
}
