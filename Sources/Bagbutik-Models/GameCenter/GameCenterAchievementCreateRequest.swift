import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementCreateRequest
 A request body you use to create a Game Center achievement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementcreaterequest>
 */
public struct GameCenterAchievementCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "gameCenterAchievements" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        public struct Attributes: Codable {
            public let points: Int
            public let referenceName: String
            public let repeatable: Bool
            public let showBeforeEarned: Bool
            public let vendorIdentifier: String

            public init(points: Int,
                        referenceName: String,
                        repeatable: Bool,
                        showBeforeEarned: Bool,
                        vendorIdentifier: String)
            {
                self.points = points
                self.referenceName = referenceName
                self.repeatable = repeatable
                self.showBeforeEarned = showBeforeEarned
                self.vendorIdentifier = vendorIdentifier
            }
        }

        public struct Relationships: Codable {
            public var gameCenterDetail: GameCenterDetail?
            public var gameCenterGroup: GameCenterGroup?

            public init(gameCenterDetail: GameCenterDetail? = nil,
                        gameCenterGroup: GameCenterGroup? = nil)
            {
                self.gameCenterDetail = gameCenterDetail
                self.gameCenterGroup = gameCenterGroup
            }

            public struct GameCenterDetail: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "gameCenterDetails" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }

            public struct GameCenterGroup: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "gameCenterGroups" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
