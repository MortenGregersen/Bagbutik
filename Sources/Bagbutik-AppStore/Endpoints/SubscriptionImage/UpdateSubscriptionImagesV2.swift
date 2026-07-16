import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a subscription image
     Commit the asset upload for a subscription image configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionImagesV2(id: String,
                                           requestBody: SubscriptionImageV2UpdateRequest) -> Request<SubscriptionImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
