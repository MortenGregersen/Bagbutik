import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeamUpdateRequest
 The request body you use to modify a team.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamupdaterequest>
 */
public struct GameCenterMatchmakingTeamUpdateRequest: Codable, RequestBody {
    /// The data structure of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterMatchmakingTeamUpdateRequest.Data
     The data structure of the request body you use to modify a team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The unique identifier for the team.
        public let id: String
        /// The type of resource object.
        public var type: String { "gameCenterMatchmakingTeams" }
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
         # GameCenterMatchmakingTeamUpdateRequest.Data.Attributes
         The attributes of a team that you modify.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The maximum number of players on the team.
            public var maxPlayers: Int?
            /// The minimum number of players on the team.
            public var minPlayers: Int?

            public init(maxPlayers: Int? = nil,
                        minPlayers: Int? = nil)
            {
                self.maxPlayers = maxPlayers
                self.minPlayers = minPlayers
            }
        }
    }
}
