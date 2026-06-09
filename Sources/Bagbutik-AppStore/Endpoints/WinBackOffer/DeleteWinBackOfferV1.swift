import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Win-Back Offer
     The data structure that represents a delete-v1-win back offers-{id} resource.

     Remove a win-back offer for a specific subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-winBackOffers-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteWinBackOfferV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers/\(id)",
            method: .delete)
    }
}
