import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the territory availablity of an in-app purchase
     Update the territory availablity of a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_territory_availablity_of_an_in-app_purchase>

     - Parameter requestBody: InAppPurchaseAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseAvailabilityV1(requestBody: InAppPurchaseAvailabilityCreateRequest) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchaseAvailabilities", method: .post, requestBody: requestBody)
    }
}
