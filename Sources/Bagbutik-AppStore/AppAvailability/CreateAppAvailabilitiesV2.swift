import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Pre-Order
     Create an app pre-order and set the expected app release date.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_pre-order>

     - Parameter requestBody: AppAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppAvailabilitiesV2(requestBody: AppAvailabilityV2CreateRequest) -> Request<AppAvailabilityV2Response, ErrorResponse> {
        .init(path: "/v2/appAvailabilities", method: .post, requestBody: requestBody)
    }
}
