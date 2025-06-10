import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a win-back offer
     Create a win-back offer for a specific subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-winBackOffers>

     - Parameter requestBody: WinBackOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createWinBackOfferV1(requestBody: WinBackOfferCreateRequest) -> Request<WinBackOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers",
            method: .post,
            requestBody: requestBody)
    }
}
