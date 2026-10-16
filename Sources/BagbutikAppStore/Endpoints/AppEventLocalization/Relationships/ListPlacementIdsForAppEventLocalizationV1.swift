import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the placement IDs for an in-app event localization

     Get a list of placement resource IDs for a specific in-app event localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventLocalizations-_id_-relationships-placements>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPlacementIdsForAppEventLocalizationV1(id: String,
                                                          limit: Int? = nil) -> Request<AppEventLocalizationPlacementsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)/relationships/placements",
            method: .get,
            parameters: .init(limit: limit))
    }
}
