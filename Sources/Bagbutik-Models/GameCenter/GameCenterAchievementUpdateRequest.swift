import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementUpdateRequest
 The request body you use to update a Game Center achievement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementupdaterequest>
 */
public struct GameCenterAchievementUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "gameCenterAchievements" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        public struct Attributes: Codable {
            public var archived: Bool?
            public var points: Int?
            public var referenceName: String?
            public var repeatable: Bool?
            public var showBeforeEarned: Bool?

            public init(archived: Bool? = nil,
                        points: Int? = nil,
                        referenceName: String? = nil,
                        repeatable: Bool? = nil,
                        showBeforeEarned: Bool? = nil)
            {
                self.archived = archived
                self.points = points
                self.referenceName = referenceName
                self.repeatable = repeatable
                self.showBeforeEarned = showBeforeEarned
            }
        }
    }
}
