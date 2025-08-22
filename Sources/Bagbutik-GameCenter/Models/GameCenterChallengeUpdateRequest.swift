import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeUpdateRequest
 The request body you use to update a challenge.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengeupdaterequest>
 */
public struct GameCenterChallengeUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterChallenges" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var allowedDurations: [AllowedDurations]?
            public var archived: Bool?
            public var referenceName: String?
            public var repeatable: Bool?

            public init(allowedDurations: [AllowedDurations]? = nil,
                        archived: Bool? = nil,
                        referenceName: String? = nil,
                        repeatable: Bool? = nil)
            {
                self.allowedDurations = allowedDurations
                self.archived = archived
                self.referenceName = referenceName
                self.repeatable = repeatable
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                allowedDurations = try container.decodeIfPresent([AllowedDurations].self, forKey: "allowedDurations")
                archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
                referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
                repeatable = try container.decodeIfPresent(Bool.self, forKey: "repeatable")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(allowedDurations, forKey: "allowedDurations")
                try container.encodeIfPresent(archived, forKey: "archived")
                try container.encodeIfPresent(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(repeatable, forKey: "repeatable")
            }

            public enum AllowedDurations: String, Sendable, Codable, CaseIterable {
                case oneDay = "ONE_DAY"
                case oneWeek = "ONE_WEEK"
                case threeDays = "THREE_DAYS"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = AllowedDurations(rawValue: string) {
                        self = value
                    } else if let value = AllowedDurations(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid AllowedDurations value: \(string)"
                        )
                    }
                }
            }
        }

        public struct Relationships: Codable, Sendable {
            public var leaderboard: Leaderboard?

            public init(leaderboard: Leaderboard? = nil) {
                self.leaderboard = leaderboard
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                leaderboard = try container.decodeIfPresent(Leaderboard.self, forKey: "leaderboard")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(leaderboard, forKey: "leaderboard")
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
