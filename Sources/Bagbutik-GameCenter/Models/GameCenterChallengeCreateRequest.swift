import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeCreateRequest
 The request body you use to create a challenge.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengecreaterequest>
 */
public struct GameCenterChallengeCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterChallenges" }
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
            public var allowedDurations: [AllowedDurations]?
            public let challengeType: GameCenterChallenge.Attributes.ChallengeType
            public let referenceName: String
            public var repeatable: Bool?
            public let vendorIdentifier: String

            public init(allowedDurations: [AllowedDurations]? = nil,
                        challengeType: GameCenterChallenge.Attributes.ChallengeType,
                        referenceName: String,
                        repeatable: Bool? = nil,
                        vendorIdentifier: String)
            {
                self.allowedDurations = allowedDurations
                self.challengeType = challengeType
                self.referenceName = referenceName
                self.repeatable = repeatable
                self.vendorIdentifier = vendorIdentifier
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                allowedDurations = try container.decodeIfPresent([AllowedDurations].self, forKey: "allowedDurations")
                challengeType = try container.decode(GameCenterChallenge.Attributes.ChallengeType.self, forKey: "challengeType")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                repeatable = try container.decodeIfPresent(Bool.self, forKey: "repeatable")
                vendorIdentifier = try container.decode(String.self, forKey: "vendorIdentifier")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(allowedDurations, forKey: "allowedDurations")
                try container.encode(challengeType, forKey: "challengeType")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(repeatable, forKey: "repeatable")
                try container.encode(vendorIdentifier, forKey: "vendorIdentifier")
            }

            public enum AllowedDurations: String, Sendable, Codable, CaseIterable {
                case oneDay = "ONE_DAY"
                case oneWeek = "ONE_WEEK"
                case threeDays = "THREE_DAYS"
            }
        }

        public struct Relationships: Codable, Sendable {
            public var gameCenterDetail: GameCenterDetail?
            public var gameCenterGroup: GameCenterGroup?
            public var leaderboard: Leaderboard?

            public init(gameCenterDetail: GameCenterDetail? = nil,
                        gameCenterGroup: GameCenterGroup? = nil,
                        leaderboard: Leaderboard? = nil)
            {
                self.gameCenterDetail = gameCenterDetail
                self.gameCenterGroup = gameCenterGroup
                self.leaderboard = leaderboard
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
                gameCenterGroup = try container.decodeIfPresent(GameCenterGroup.self, forKey: "gameCenterGroup")
                leaderboard = try container.decodeIfPresent(Leaderboard.self, forKey: "leaderboard")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
                try container.encodeIfPresent(gameCenterGroup, forKey: "gameCenterGroup")
                try container.encodeIfPresent(leaderboard, forKey: "leaderboard")
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

            public struct Leaderboard: Codable, Sendable {
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
        }
    }
}
