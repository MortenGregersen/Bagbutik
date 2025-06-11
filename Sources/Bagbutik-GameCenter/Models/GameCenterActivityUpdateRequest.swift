import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityUpdateRequest
 The request body you use to update an activity.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityupdaterequest>
 */
public struct GameCenterActivityUpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "gameCenterActivities" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var archived: Bool?
            public var maximumPlayersCount: Int?
            public var minimumPlayersCount: Int?
            public var playStyle: GameCenterActivity.Attributes.PlayStyle?
            public var properties: [String: String]?
            public var referenceName: String?
            public var supportsPartyCode: Bool?

            public init(archived: Bool? = nil,
                        maximumPlayersCount: Int? = nil,
                        minimumPlayersCount: Int? = nil,
                        playStyle: GameCenterActivity.Attributes.PlayStyle? = nil,
                        properties: [String: String]? = nil,
                        referenceName: String? = nil,
                        supportsPartyCode: Bool? = nil)
            {
                self.archived = archived
                self.maximumPlayersCount = maximumPlayersCount
                self.minimumPlayersCount = minimumPlayersCount
                self.playStyle = playStyle
                self.properties = properties
                self.referenceName = referenceName
                self.supportsPartyCode = supportsPartyCode
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
                maximumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "maximumPlayersCount")
                minimumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "minimumPlayersCount")
                playStyle = try container.decodeIfPresent(GameCenterActivity.Attributes.PlayStyle.self, forKey: "playStyle")
                properties = try container.decodeIfPresent([String: String].self, forKey: "properties")
                referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
                supportsPartyCode = try container.decodeIfPresent(Bool.self, forKey: "supportsPartyCode")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(archived, forKey: "archived")
                try container.encodeIfPresent(maximumPlayersCount, forKey: "maximumPlayersCount")
                try container.encodeIfPresent(minimumPlayersCount, forKey: "minimumPlayersCount")
                try container.encodeIfPresent(playStyle, forKey: "playStyle")
                try container.encodeIfPresent(properties, forKey: "properties")
                try container.encodeIfPresent(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(supportsPartyCode, forKey: "supportsPartyCode")
            }
        }
    }
}
