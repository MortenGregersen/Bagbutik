import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List One-Time Use Offer Code Values
     Get a list of one-time use offer codes for an auto-renewable subscription in CSV format.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodeOneTimeUseCodes-_id_-values>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getValuesForSubscriptionOfferCodeOneTimeUseCodeV1(id: String) -> Request<Csv, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)/values",
            method: .get)
    }
}
