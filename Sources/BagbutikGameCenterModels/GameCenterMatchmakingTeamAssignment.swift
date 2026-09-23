import BagbutikCore
import Foundation

/**
 # GameCenterMatchmakingTeamAssignment

 The assignment of a player to a specific team during a Game Center matchmaking session.

 ```
 object GameCenterMatchmakingTeamAssignment
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamassignment>
 */
public struct GameCenterMatchmakingTeamAssignment: Codable, Sendable {
    public var playerId: String?
    public var team: String?

    public init(playerId: String? = nil,
                team: String? = nil)
    {
        self.playerId = playerId
        self.team = team
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        playerId = try container.decodeIfPresent(String.self, forKey: "playerId")
        team = try container.decodeIfPresent(String.self, forKey: "team")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(playerId, forKey: "playerId")
        try container.encodeIfPresent(team, forKey: "team")
    }
}
