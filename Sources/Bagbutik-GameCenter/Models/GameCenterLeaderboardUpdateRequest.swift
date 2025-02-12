import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardUpdateRequest
 The request body you use to update a leaderboard.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardupdaterequest>
 */
public struct GameCenterLeaderboardUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterLeaderboards" }
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
            public var defaultFormatter: GameCenterLeaderboardFormatter?
            public var recurrenceDuration: String?
            public var recurrenceRule: String?
            public var recurrenceStartDate: Date?
            public var referenceName: String?
            public var scoreRangeEnd: String?
            public var scoreRangeStart: String?
            public var scoreSortType: GameCenterLeaderboard.Attributes.ScoreSortType?
            public var submissionType: GameCenterLeaderboard.Attributes.SubmissionType?

            public init(archived: Bool? = nil,
                        defaultFormatter: GameCenterLeaderboardFormatter? = nil,
                        recurrenceDuration: String? = nil,
                        recurrenceRule: String? = nil,
                        recurrenceStartDate: Date? = nil,
                        referenceName: String? = nil,
                        scoreRangeEnd: String? = nil,
                        scoreRangeStart: String? = nil,
                        scoreSortType: GameCenterLeaderboard.Attributes.ScoreSortType? = nil,
                        submissionType: GameCenterLeaderboard.Attributes.SubmissionType? = nil)
            {
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
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
                defaultFormatter = try container.decodeIfPresent(GameCenterLeaderboardFormatter.self, forKey: "defaultFormatter")
                recurrenceDuration = try container.decodeIfPresent(String.self, forKey: "recurrenceDuration")
                recurrenceRule = try container.decodeIfPresent(String.self, forKey: "recurrenceRule")
                recurrenceStartDate = try container.decodeIfPresent(Date.self, forKey: "recurrenceStartDate")
                referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
                scoreRangeEnd = try container.decodeIfPresent(String.self, forKey: "scoreRangeEnd")
                scoreRangeStart = try container.decodeIfPresent(String.self, forKey: "scoreRangeStart")
                scoreSortType = try container.decodeIfPresent(GameCenterLeaderboard.Attributes.ScoreSortType.self, forKey: "scoreSortType")
                submissionType = try container.decodeIfPresent(GameCenterLeaderboard.Attributes.SubmissionType.self, forKey: "submissionType")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
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
            }
        }
    }
}
