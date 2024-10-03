import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a win-back offer
     Edit details for a specific win-back offer.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-winBackOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: WinBackOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateWinBackOfferV1(id: String,
                                     requestBody: WinBackOfferUpdateRequest) -> Request<WinBackOfferResponse, ErrorResponse>
    {
        .init(path: "/v1/winBackOffers/\(id)", method: .patch, requestBody: requestBody)
    }
}
