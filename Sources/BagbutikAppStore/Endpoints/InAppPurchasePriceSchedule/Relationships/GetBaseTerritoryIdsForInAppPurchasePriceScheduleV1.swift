import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the base territory ID for an in-app purchase price schedule

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_-relationships-baseTerritory>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBaseTerritoryIdsForInAppPurchasePriceScheduleV1(id: String) -> Request<InAppPurchasePriceScheduleBaseTerritoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)/relationships/baseTerritory",
            method: .get)
    }
}
