import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityCreateRequest
 The request body you use to create an activity resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivitycreaterequest>
 */
public struct GameCenterActivityCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "gameCenterActivities" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var maximumPlayersCount: Int?
            public var minimumPlayersCount: Int?
            public var playStyle: GameCenterActivity.Attributes.PlayStyle?
            public var properties: [String: String]?
            public let referenceName: String
            public var supportsPartyCode: Bool?
            public let vendorIdentifier: String

            public init(maximumPlayersCount: Int? = nil,
                        minimumPlayersCount: Int? = nil,
                        playStyle: GameCenterActivity.Attributes.PlayStyle? = nil,
                        properties: [String: String]? = nil,
                        referenceName: String,
                        supportsPartyCode: Bool? = nil,
                        vendorIdentifier: String)
            {
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
                maximumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "maximumPlayersCount")
                minimumPlayersCount = try container.decodeIfPresent(Int.self, forKey: "minimumPlayersCount")
                playStyle = try container.decodeIfPresent(GameCenterActivity.Attributes.PlayStyle.self, forKey: "playStyle")
                properties = try container.decodeIfPresent([String: String].self, forKey: "properties")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                supportsPartyCode = try container.decodeIfPresent(Bool.self, forKey: "supportsPartyCode")
                vendorIdentifier = try container.decode(String.self, forKey: "vendorIdentifier")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(maximumPlayersCount, forKey: "maximumPlayersCount")
                try container.encodeIfPresent(minimumPlayersCount, forKey: "minimumPlayersCount")
                try container.encodeIfPresent(playStyle, forKey: "playStyle")
                try container.encodeIfPresent(properties, forKey: "properties")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(supportsPartyCode, forKey: "supportsPartyCode")
                try container.encode(vendorIdentifier, forKey: "vendorIdentifier")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var gameCenterDetail: GameCenterDetail?
            public var gameCenterGroup: GameCenterGroup?

            public init(gameCenterDetail: GameCenterDetail? = nil,
                        gameCenterGroup: GameCenterGroup? = nil)
            {
                self.gameCenterDetail = gameCenterDetail
                self.gameCenterGroup = gameCenterGroup
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
                gameCenterGroup = try container.decodeIfPresent(GameCenterGroup.self, forKey: "gameCenterGroup")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
                try container.encodeIfPresent(gameCenterGroup, forKey: "gameCenterGroup")
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
        }
    }
}
