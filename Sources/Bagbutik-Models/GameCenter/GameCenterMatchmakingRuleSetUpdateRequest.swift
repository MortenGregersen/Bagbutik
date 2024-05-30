import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetUpdateRequest
 The request body you use to modify a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetupdaterequest>
 */
public struct GameCenterMatchmakingRuleSetUpdateRequest: Codable, RequestBody {
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
     # GameCenterMatchmakingRuleSetUpdateRequest.Data
     The data structure of the request body you use to modify a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The unique identifier for the rule set.
        public let id: String
        /// The type of resource.
        public var type: String { "gameCenterMatchmakingRuleSets" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        /**
         # GameCenterMatchmakingRuleSetUpdateRequest.Data.Attributes
         The attributes of a rule set that you modify.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesetupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The maximum number of players who can join the matches that Game Center finds using these rules.
            public var maxPlayers: Int?
            /// The minimum number of players who can join the matches that Game Center finds using these rules.
            public var minPlayers: Int?

            public init(maxPlayers: Int? = nil,
                        minPlayers: Int? = nil)
            {
                self.maxPlayers = maxPlayers
                self.minPlayers = minPlayers
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                maxPlayers = try container.decodeIfPresent(Int.self, forKey: .maxPlayers)
                minPlayers = try container.decodeIfPresent(Int.self, forKey: .minPlayers)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(maxPlayers, forKey: .maxPlayers)
                try container.encodeIfPresent(minPlayers, forKey: .minPlayers)
            }

            private enum CodingKeys: String, CodingKey {
                case maxPlayers
                case minPlayers
            }
        }
    }
}
