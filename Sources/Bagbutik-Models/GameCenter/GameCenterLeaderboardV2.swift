import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardV2
 The data structure that represents a Game Center leaderboard v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardv2>
 */
public struct GameCenterLeaderboardV2: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterLeaderboards" }
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
        public var activityProperties: [String: String]?
        public var archived: Bool?
        public var defaultFormatter: GameCenterLeaderboardFormatter?
        public var recurrenceDuration: String?
        public var recurrenceRule: String?
        public var recurrenceStartDate: Date?
        public var referenceName: String?
        public var scoreRangeEnd: String?
        public var scoreRangeStart: String?
        public var scoreSortType: ScoreSortType?
        public var submissionType: SubmissionType?
        public var vendorIdentifier: String?
        public var visibility: Visibility?

        public init(activityProperties: [String: String]? = nil,
                    archived: Bool? = nil,
                    defaultFormatter: GameCenterLeaderboardFormatter? = nil,
                    recurrenceDuration: String? = nil,
                    recurrenceRule: String? = nil,
                    recurrenceStartDate: Date? = nil,
                    referenceName: String? = nil,
                    scoreRangeEnd: String? = nil,
                    scoreRangeStart: String? = nil,
                    scoreSortType: ScoreSortType? = nil,
                    submissionType: SubmissionType? = nil,
                    vendorIdentifier: String? = nil,
                    visibility: Visibility? = nil)
        {
            self.activityProperties = activityProperties
            self.archived = archived
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
            archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
            defaultFormatter = try container.decodeIfPresent(GameCenterLeaderboardFormatter.self, forKey: "defaultFormatter")
            recurrenceDuration = try container.decodeIfPresent(String.self, forKey: "recurrenceDuration")
            recurrenceRule = try container.decodeIfPresent(String.self, forKey: "recurrenceRule")
            recurrenceStartDate = try container.decodeIfPresent(Date.self, forKey: "recurrenceStartDate")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            scoreRangeEnd = try container.decodeIfPresent(String.self, forKey: "scoreRangeEnd")
            scoreRangeStart = try container.decodeIfPresent(String.self, forKey: "scoreRangeStart")
            scoreSortType = try container.decodeIfPresent(ScoreSortType.self, forKey: "scoreSortType")
            submissionType = try container.decodeIfPresent(SubmissionType.self, forKey: "submissionType")
            vendorIdentifier = try container.decodeIfPresent(String.self, forKey: "vendorIdentifier")
            visibility = try container.decodeIfPresent(Visibility.self, forKey: "visibility")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(activityProperties, forKey: "activityProperties")
            try container.encodeIfPresent(archived, forKey: "archived")
            try container.encodeIfPresent(defaultFormatter, forKey: "defaultFormatter")
            try container.encodeIfPresent(recurrenceDuration, forKey: "recurrenceDuration")
            try container.encodeIfPresent(recurrenceRule, forKey: "recurrenceRule")
            try container.encodeIfPresent(recurrenceStartDate, forKey: "recurrenceStartDate")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(scoreRangeEnd, forKey: "scoreRangeEnd")
            try container.encodeIfPresent(scoreRangeStart, forKey: "scoreRangeStart")
            try container.encodeIfPresent(scoreSortType, forKey: "scoreSortType")
            try container.encodeIfPresent(submissionType, forKey: "submissionType")
            try container.encodeIfPresent(vendorIdentifier, forKey: "vendorIdentifier")
            try container.encodeIfPresent(visibility, forKey: "visibility")
        }

        public enum ScoreSortType: String, Sendable, Codable, CaseIterable {
            case asc = "ASC"
            case desc = "DESC"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScoreSortType(rawValue: string) {
                    self = value
                } else if let value = ScoreSortType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScoreSortType value: \(string)"
                    )
                }
            }
        }

        public enum SubmissionType: String, Sendable, Codable, CaseIterable {
            case bestScore = "BEST_SCORE"
            case mostRecentScore = "MOST_RECENT_SCORE"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubmissionType(rawValue: string) {
                    self = value
                } else if let value = SubmissionType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubmissionType value: \(string)"
                    )
                }
            }
        }

        public enum Visibility: String, Sendable, Codable, CaseIterable {
            case hideForAll = "HIDE_FOR_ALL"
            case showForAll = "SHOW_FOR_ALL"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Visibility(rawValue: string) {
                    self = value
                } else if let value = Visibility(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Visibility value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var activity: Activity?
        public var challenge: Challenge?
        public var gameCenterDetail: GameCenterDetail?
        public var gameCenterGroup: GameCenterGroup?
        public var gameCenterLeaderboardSets: GameCenterLeaderboardSets?
        public var versions: Versions?

        public init(activity: Activity? = nil,
                    challenge: Challenge? = nil,
                    gameCenterDetail: GameCenterDetail? = nil,
                    gameCenterGroup: GameCenterGroup? = nil,
                    gameCenterLeaderboardSets: GameCenterLeaderboardSets? = nil,
                    versions: Versions? = nil)
        {
            self.activity = activity
            self.challenge = challenge
            self.gameCenterDetail = gameCenterDetail
            self.gameCenterGroup = gameCenterGroup
            self.gameCenterLeaderboardSets = gameCenterLeaderboardSets
            self.versions = versions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            activity = try container.decodeIfPresent(Activity.self, forKey: "activity")
            challenge = try container.decodeIfPresent(Challenge.self, forKey: "challenge")
            gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
            gameCenterGroup = try container.decodeIfPresent(GameCenterGroup.self, forKey: "gameCenterGroup")
            gameCenterLeaderboardSets = try container.decodeIfPresent(GameCenterLeaderboardSets.self, forKey: "gameCenterLeaderboardSets")
            versions = try container.decodeIfPresent(Versions.self, forKey: "versions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(activity, forKey: "activity")
            try container.encodeIfPresent(challenge, forKey: "challenge")
            try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
            try container.encodeIfPresent(gameCenterGroup, forKey: "gameCenterGroup")
            try container.encodeIfPresent(gameCenterLeaderboardSets, forKey: "gameCenterLeaderboardSets")
            try container.encodeIfPresent(versions, forKey: "versions")
        }

        public struct Activity: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterActivities" }

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

        public struct Challenge: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterChallenges" }

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

        public struct GameCenterLeaderboardSets: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
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
