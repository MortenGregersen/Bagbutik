import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Pre-Order V1
     Update the release date for your app pre-order.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appPreOrders-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppPreOrder representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateAppPreOrderV1(id: String,
                                    requestBody: AppPreOrderUpdateRequest) -> Request<AppPreOrderResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreOrders/\(id)", method: .patch, requestBody: requestBody)
    }
}
