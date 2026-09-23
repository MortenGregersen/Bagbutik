import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Read the Group Leaderboard Set in a Leaderboard Set

     List all the group leaderboard sets in a leaderboard set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSets-_id_-relationships-groupLeaderboardSet>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGroupLeaderboardSetIdsForGameCenterLeaderboardSetV1(id: String) -> Request<GameCenterLeaderboardSetGroupLeaderboardSetLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)/relationships/groupLeaderboardSet",
            method: .get)
    }
}
