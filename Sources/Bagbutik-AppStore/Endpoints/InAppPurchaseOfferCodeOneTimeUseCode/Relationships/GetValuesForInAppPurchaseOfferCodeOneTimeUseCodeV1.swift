import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all values for an in-app purchase offer code one-time use code
     Get a list of values for a specific in-app purchase offer code one-time use code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodeOneTimeUseCodes-_id_-values>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getValuesForInAppPurchaseOfferCodeOneTimeUseCodeV1(id: String) -> Request<Csv, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes/\(id)/values",
            method: .get)
    }
}
