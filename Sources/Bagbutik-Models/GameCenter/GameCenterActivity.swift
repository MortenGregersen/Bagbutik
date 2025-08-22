import Bagbutik_Core
import Foundation

/**
 # GameCenterActivity
 The data structure that represents a Game Center activity resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivity>
 */
public struct GameCenterActivity: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterActivities" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var archived: Bool?
        public var maximumPlayersCount: Int?
        public var minimumPlayersCount: Int?
        public var playStyle: PlayStyle?
        public var properties: [String: String]?
        public var referenceName: String?
        public var supportsPartyCode: Bool?
        public var vendorIdentifier: String?

        public init(archived: Bool? = nil,
                    maximumPlayersCount: Int? = nil,
                    minimumPlayersCount: Int? = nil,
                    playStyle: PlayStyle? = nil,
                    properties: [String: String]? = nil,
                    referenceName: String? = nil,
                    supportsPartyCode: Bool? = nil,
                    vendorIdentifier: String? = nil)
        {
            self.archived = archived
            self.maximumPlayersCount = maximumPlayersCount
            self.minimumPlayersCount = minimumPlayersCount
            self.playStyle = playStyle
            self.properties = properties
            self.referenceName = referenceName
            self.supportsPartyCode = supportsPartyCode
            self.vendorIdentifier = vendorIdentifier
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
            maximumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "maximumPlayersCount")
            minimumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "minimumPlayersCount")
            playStyle = try container.decodeIfPresent(PlayStyle.self, forKey: "playStyle")
            properties = try container.decodeIfPresent([String: String].self, forKey: "properties")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            supportsPartyCode = try container.decodeIfPresent(Bool.self, forKey: "supportsPartyCode")
            vendorIdentifier = try container.decodeIfPresent(String.self, forKey: "vendorIdentifier")
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
            try container.encodeIfPresent(vendorIdentifier, forKey: "vendorIdentifier")
        }

        public enum PlayStyle: String, Sendable, Codable, CaseIterable {
            case asynchronous = "ASYNCHRONOUS"
            case synchronous = "SYNCHRONOUS"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PlayStyle(rawValue: string) {
                    self = value
                } else if let value = PlayStyle(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PlayStyle value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var achievements: Achievements?
        public var gameCenterDetail: GameCenterDetail?
        public var gameCenterGroup: GameCenterGroup?
        public var leaderboards: Leaderboards?
        public var versions: Versions?

        public init(achievements: Achievements? = nil,
                    gameCenterDetail: GameCenterDetail? = nil,
                    gameCenterGroup: GameCenterGroup? = nil,
                    leaderboards: Leaderboards? = nil,
                    versions: Versions? = nil)
        {
            self.achievements = achievements
            self.gameCenterDetail = gameCenterDetail
            self.gameCenterGroup = gameCenterGroup
            self.leaderboards = leaderboards
            self.versions = versions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            achievements = try container.decodeIfPresent(Achievements.self, forKey: "achievements")
            gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
            gameCenterGroup = try container.decodeIfPresent(GameCenterGroup.self, forKey: "gameCenterGroup")
            leaderboards = try container.decodeIfPresent(Leaderboards.self, forKey: "leaderboards")
            versions = try container.decodeIfPresent(Versions.self, forKey: "versions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(achievements, forKey: "achievements")
            try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
            try container.encodeIfPresent(gameCenterGroup, forKey: "gameCenterGroup")
            try container.encodeIfPresent(leaderboards, forKey: "leaderboards")
            try container.encodeIfPresent(versions, forKey: "versions")
        }

        public struct Achievements: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterAchievements" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct GameCenterDetail: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterDetails" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct GameCenterGroup: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterGroups" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct Leaderboards: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterLeaderboards" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct Versions: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterActivityVersions" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
