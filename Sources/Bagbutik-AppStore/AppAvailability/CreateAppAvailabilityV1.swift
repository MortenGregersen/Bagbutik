import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify territory availability for an app
     Update the territories where an app will be available.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_territory_availability_for_an_app>

     - Parameter requestBody: AppAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppAvailabilityV1(requestBody: AppAvailabilityCreateRequest) -> Request<AppAvailabilityResponse, ErrorResponse> {
        .init(path: "/v1/appAvailabilities", method: .post, requestBody: requestBody)
    }
}
