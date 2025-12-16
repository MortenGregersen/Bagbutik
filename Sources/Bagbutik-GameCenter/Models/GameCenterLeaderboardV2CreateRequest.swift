import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardV2CreateRequest
 The request body you use to create a Game Center leaderboard v2.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardv2createrequest>
 */
public struct GameCenterLeaderboardV2CreateRequest: Codable, Sendable, RequestBody {
    public let data: Data
    public var included: [GameCenterLeaderboardVersionV2InlineCreate]?

    public init(data: Data,
                included: [GameCenterLeaderboardVersionV2InlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterLeaderboardVersionV2InlineCreate].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    public struct Data: Codable, Sendable {
        public var type: String { "gameCenterLeaderboards" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var activityProperties: [String: String]?
            public let defaultFormatter: GameCenterLeaderboardFormatter
            public var recurrenceDuration: String?
            public var recurrenceRule: String?
            public var recurrenceStartDate: Date?
            public let referenceName: String
            public var scoreRangeEnd: String?
            public var scoreRangeStart: String?
            public let scoreSortType: GameCenterLeaderboardV2.Attributes.ScoreSortType
            public let submissionType: GameCenterLeaderboardV2.Attributes.SubmissionType
            public let vendorIdentifier: String
            public var visibility: GameCenterLeaderboardV2.Attributes.Visibility?

            public init(activityProperties: [String: String]? = nil,
                        defaultFormatter: GameCenterLeaderboardFormatter,
                        recurrenceDuration: String? = nil,
                        recurrenceRule: String? = nil,
                        recurrenceStartDate: Date? = nil,
                        referenceName: String,
                        scoreRangeEnd: String? = nil,
                        scoreRangeStart: String? = nil,
                        scoreSortType: GameCenterLeaderboardV2.Attributes.ScoreSortType,
                        submissionType: GameCenterLeaderboardV2.Attributes.SubmissionType,
                        vendorIdentifier: String,
                        visibility: GameCenterLeaderboardV2.Attributes.Visibility? = nil)
            {
                self.activityProperties = activityProperties
                self.defaultFormatter = defaultFormatter
                self.recurrenceDuration = recurrenceDuration
                self.recurrenceRule = recurrenceRule
                self.recurrenceStartDate = recurrenceStartDate
                self.referenceName = referenceName
                self.scoreRangeEnd = scoreRangeEnd
                self.scoreRangeStart = scoreRangeStart
                self.scoreSortType = scoreSortType
                self.submissionType = submissionType
                self.vendorIdentifier = vendorIdentifier
                self.visibility = visibility
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                activityProperties = try container.decodeIfPresent([String: String].self, forKey: "activityProperties")
                defaultFormatter = try container.decode(GameCenterLeaderboardFormatter.self, forKey: "defaultFormatter")
                recurrenceDuration = try container.decodeIfPresent(String.self, forKey: "recurrenceDuration")
                recurrenceRule = try container.decodeIfPresent(String.self, forKey: "recurrenceRule")
                recurrenceStartDate = try container.decodeIfPresent(Date.self, forKey: "recurrenceStartDate")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                scoreRangeEnd = try container.decodeIfPresent(String.self, forKey: "scoreRangeEnd")
                scoreRangeStart = try container.decodeIfPresent(String.self, forKey: "scoreRangeStart")
                scoreSortType = try container.decode(GameCenterLeaderboardV2.Attributes.ScoreSortType.self, forKey: "scoreSortType")
                submissionType = try container.decode(GameCenterLeaderboardV2.Attributes.SubmissionType.self, forKey: "submissionType")
                vendorIdentifier = try container.decode(String.self, forKey: "vendorIdentifier")
                visibility = try container.decodeIfPresent(GameCenterLeaderboardV2.Attributes.Visibility.self, forKey: "visibility")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(activityProperties, forKey: "activityProperties")
                try container.encode(defaultFormatter, forKey: "defaultFormatter")
                try container.encodeIfPresent(recurrenceDuration, forKey: "recurrenceDuration")
                try container.encodeIfPresent(recurrenceRule, forKey: "recurrenceRule")
                try container.encodeIfPresent(recurrenceStartDate, forKey: "recurrenceStartDate")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(scoreRangeEnd, forKey: "scoreRangeEnd")
                try container.encodeIfPresent(scoreRangeStart, forKey: "scoreRangeStart")
                try container.encode(scoreSortType, forKey: "scoreSortType")
                try container.encode(submissionType, forKey: "submissionType")
                try container.encode(vendorIdentifier, forKey: "vendorIdentifier")
                try container.encodeIfPresent(visibility, forKey: "visibility")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var gameCenterDetail: GameCenterDetail?
            public var gameCenterGroup: GameCenterGroup?
            public var gameCenterLeaderboardSets: GameCenterLeaderboardSets?
            public let versions: Versions

            public init(gameCenterDetail: GameCenterDetail? = nil,
                        gameCenterGroup: GameCenterGroup? = nil,
                        gameCenterLeaderboardSets: GameCenterLeaderboardSets? = nil,
                        versions: Versions)
            {
                self.gameCenterDetail = gameCenterDetail
                self.gameCenterGroup = gameCenterGroup
                self.gameCenterLeaderboardSets = gameCenterLeaderboardSets
                self.versions = versions
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
                gameCenterGroup = try container.decodeIfPresent(GameCenterGroup.self, forKey: "gameCenterGroup")
                gameCenterLeaderboardSets = try container.decodeIfPresent(GameCenterLeaderboardSets.self, forKey: "gameCenterLeaderboardSets")
                versions = try container.decode(Versions.self, forKey: "versions")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
                try container.encodeIfPresent(gameCenterGroup, forKey: "gameCenterGroup")
                try container.encodeIfPresent(gameCenterLeaderboardSets, forKey: "gameCenterLeaderboardSets")
                try container.encode(versions, forKey: "versions")
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

            public struct GameCenterLeaderboardSets: Codable, Sendable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "gameCenterLeaderboardSets" }

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
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "gameCenterLeaderboardVersions" }

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
