import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Territory Availabilty for an App Pre-Order
     Update the release territories for your app pre-order.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_territory_availabilty_for_an_app_pre-order>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: TerritoryAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateTerritoryAvailabilityV1(id: String,
                                              requestBody: TerritoryAvailabilityUpdateRequest) -> Request<TerritoryAvailabilityResponse, ErrorResponse>
    {
        .init(path: "/v1/territoryAvailabilities/\(id)", method: .patch, requestBody: requestBody)
    }
}
