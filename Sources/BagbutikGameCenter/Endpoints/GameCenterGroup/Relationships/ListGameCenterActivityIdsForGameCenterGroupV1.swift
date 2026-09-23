import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List activity IDs for a Game Center group

     Get a list of activity IDs for a specific Game Center group.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-relationships-gameCenterActivities>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterActivityIdsForGameCenterGroupV1(id: String,
                                                              limit: Int? = nil) -> Request<GameCenterGroupGameCenterActivitiesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterActivities",
            method: .get,
            parameters: .init(limit: limit))
    }
}
