import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Territory Availablity of an In-App Purchase
     Update the territory availablity of a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseAvailabilities>

     - Parameter requestBody: InAppPurchaseAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseAvailabilityV1(requestBody: InAppPurchaseAvailabilityCreateRequest) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
