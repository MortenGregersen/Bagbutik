import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardEntrySubmissionCreateRequest
 The request body you use to create an Game Center leaderboard entry submssion.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardentrysubmissioncreaterequest>
 */
public struct GameCenterLeaderboardEntrySubmissionCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterLeaderboardEntrySubmissionCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardentrysubmissioncreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "gameCenterLeaderboardEntrySubmissions" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        /**
         # GameCenterLeaderboardEntrySubmissionCreateRequest.Data.Attributes
         Attributes that you set that describe the new leaderboard entry.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardentrysubmissioncreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let bundleId: String
            public var challengeIds: [String]?
            public var context: String?
            public let scopedPlayerId: String
            public let score: String
            public var submittedDate: Date?
            public let vendorIdentifier: String

            public init(bundleId: String,
                        challengeIds: [String]? = nil,
                        context: String? = nil,
                        scopedPlayerId: String,
                        score: String,
                        submittedDate: Date? = nil,
                        vendorIdentifier: String)
            {
                self.bundleId = bundleId
                self.challengeIds = challengeIds
                self.context = context
                self.scopedPlayerId = scopedPlayerId
                self.score = score
                self.submittedDate = submittedDate
                self.vendorIdentifier = vendorIdentifier
            }
        }
    }
}
