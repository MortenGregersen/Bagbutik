import Bagbutik_Core

public extension Request {
    /**
     # List One-Time Use Offer Code Values
     Get a list of one-time use offer codes for an auto-renewable subscription in CSV format.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_one-time_use_offer_code_values>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getValuesForSubscriptionOfferCodeOneTimeUseCodeV1(id: String) -> Request<Csv, ErrorResponse> {
        .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)/values", method: .get)
    }
}
