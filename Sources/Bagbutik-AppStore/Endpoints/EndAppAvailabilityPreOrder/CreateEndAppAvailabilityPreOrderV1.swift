import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # End an App Pre-Order
     End the pre-order for your app and release to store immediately.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-endAppAvailabilityPreOrders>

     - Parameter requestBody: EndAppAvailabilityPreOrder representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createEndAppAvailabilityPreOrderV1(requestBody: EndAppAvailabilityPreOrderCreateRequest) -> Request<EndAppAvailabilityPreOrderResponse, ErrorResponse> {
        .init(path: "/v1/endAppAvailabilityPreOrders", method: .post, requestBody: requestBody)
    }
}
