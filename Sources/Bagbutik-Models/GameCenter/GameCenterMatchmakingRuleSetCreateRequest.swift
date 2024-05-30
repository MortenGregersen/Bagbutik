import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetCreateRequest
 The request body you use to create a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetcreaterequest>
 */
public struct GameCenterMatchmakingRuleSetCreateRequest: Codable, RequestBody {
    /// The data structure of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # GameCenterMatchmakingRuleSetCreateRequest.Data
     The data structure of the request body you use to create a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "gameCenterMatchmakingRuleSets" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        /**
         # GameCenterMatchmakingRuleSetCreateRequest.Data.Attributes
         The attributes for a rule set that you create.

         The `minPlayers` and `maxPlayers` attributes constrain the range of players in the match requests. If you don’t set the `GKMatchRequest.`[minPlayers](https://developer.apple.com/documentation/gamekit/gkmatchrequest/1520550-minplayers) and `GKMatchRequest.`[maxPlayers](https://developer.apple.com/documentation/gamekit/gkmatchrequest/1521083-maxplayers) properties in your code, the properties default to the rule set `minPlayers` and `maxPlayers` attributes. If you set the [GKMatchRequest](https://developer.apple.com/documentation/gamekit/gkmatchrequest) properties, use values that are in the rule set range.
         For example, if the match request range is `[2, 4]` and the rule set range is `[2,8]`, Game Center finds players within the `[2, 4]` match request range. However, if the match request range is `[2, 8]` and the rule set range is `[3, 4]`, Game Center ignores the match request properties and finds players within the `[3, 4]` rule set range. If the match request range is `[8, 8]` and the rule set range is `[2, 4]` (outside of the rule set range), Game Center never finds players for that request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The maximum number of players who can join the matches that Game Center finds using these rules.
            public let maxPlayers: Int
            /// The minimum number of players who can join the matches that Game Center finds using these rules.
            public let minPlayers: Int
            /// A name for the rule set that’s unique within the scope of your development team.
            public let referenceName: String
            /// The version of the expression language that all the rules in this rule set use. The only possible value is `1`.
            public let ruleLanguageVersion: Int

            public init(maxPlayers: Int,
                        minPlayers: Int,
                        referenceName: String,
                        ruleLanguageVersion: Int)
            {
                self.maxPlayers = maxPlayers
                self.minPlayers = minPlayers
                self.referenceName = referenceName
                self.ruleLanguageVersion = ruleLanguageVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                maxPlayers = try container.decode(Int.self, forKey: .maxPlayers)
                minPlayers = try container.decode(Int.self, forKey: .minPlayers)
                referenceName = try container.decode(String.self, forKey: .referenceName)
                ruleLanguageVersion = try container.decode(Int.self, forKey: .ruleLanguageVersion)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(maxPlayers, forKey: .maxPlayers)
                try container.encode(minPlayers, forKey: .minPlayers)
                try container.encode(referenceName, forKey: .referenceName)
                try container.encode(ruleLanguageVersion, forKey: .ruleLanguageVersion)
            }

            private enum CodingKeys: String, CodingKey {
                case maxPlayers
                case minPlayers
                case referenceName
                case ruleLanguageVersion
            }
        }
    }
}
