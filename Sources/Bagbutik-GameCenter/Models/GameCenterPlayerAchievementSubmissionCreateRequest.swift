import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterPlayerAchievementSubmissionCreateRequest
 The request body you use to create an Game Center player achievement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterplayerachievementsubmissioncreaterequest>
 */
public struct GameCenterPlayerAchievementSubmissionCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterPlayerAchievementSubmissions" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public let bundleId: String
            public var challengeIds: [String]?
            public let percentageAchieved: Int
            public let scopedPlayerId: String
            public var submittedDate: Date?
            public let vendorIdentifier: String

            public init(bundleId: String,
                        challengeIds: [String]? = nil,
                        percentageAchieved: Int,
                        scopedPlayerId: String,
                        submittedDate: Date? = nil,
                        vendorIdentifier: String)
            {
                self.bundleId = bundleId
                self.challengeIds = challengeIds
                self.percentageAchieved = percentageAchieved
                self.scopedPlayerId = scopedPlayerId
                self.submittedDate = submittedDate
                self.vendorIdentifier = vendorIdentifier
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                bundleId = try container.decode(String.self, forKey: "bundleId")
                challengeIds = try container.decodeIfPresent([String].self, forKey: "challengeIds")
                percentageAchieved = try container.decode(Int.self, forKey: "percentageAchieved")
                scopedPlayerId = try container.decode(String.self, forKey: "scopedPlayerId")
                submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
                vendorIdentifier = try container.decode(String.self, forKey: "vendorIdentifier")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(bundleId, forKey: "bundleId")
                try container.encodeIfPresent(challengeIds, forKey: "challengeIds")
                try container.encode(percentageAchieved, forKey: "percentageAchieved")
                try container.encode(scopedPlayerId, forKey: "scopedPlayerId")
                try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
                try container.encode(vendorIdentifier, forKey: "vendorIdentifier")
            }
        }
    }
}
