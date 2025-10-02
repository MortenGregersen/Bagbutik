import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingRuleSetTestResponse
 The response body for testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestresponse>
 */
public struct GameCenterMatchmakingRuleSetTestResponse: Codable, Sendable {
    public let data: GameCenterMatchmakingRuleSetTest
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingRuleSetTest,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterMatchmakingRuleSetTest.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public enum Included: Codable, Sendable {
        case gameCenterMatchmakingTestPlayerProperty(GameCenterMatchmakingTestPlayerProperty)
        case gameCenterMatchmakingTestRequest(GameCenterMatchmakingTestRequest)

        public init(from decoder: Decoder) throws {
            if let gameCenterMatchmakingTestPlayerProperty = try? GameCenterMatchmakingTestPlayerProperty(from: decoder) {
                self = .gameCenterMatchmakingTestPlayerProperty(gameCenterMatchmakingTestPlayerProperty)
            } else if let gameCenterMatchmakingTestRequest = try? GameCenterMatchmakingTestRequest(from: decoder) {
                self = .gameCenterMatchmakingTestRequest(gameCenterMatchmakingTestRequest)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterMatchmakingTestPlayerProperty(value):
                try value.encode(to: encoder)
            case let .gameCenterMatchmakingTestRequest(value):
                try value.encode(to: encoder)
            }
        }
    }
}
