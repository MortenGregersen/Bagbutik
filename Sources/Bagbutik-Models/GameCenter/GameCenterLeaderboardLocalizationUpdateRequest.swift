import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardLocalizationUpdateRequest
 The request body you use to update a leaderboard localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalizationupdaterequest>
 */
public struct GameCenterLeaderboardLocalizationUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterLeaderboardLocalizations" }
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
            public var formatterOverride: GameCenterLeaderboardFormatter?
            public var formatterSuffix: String?
            public var formatterSuffixSingular: String?
            public var name: String?

            public init(formatterOverride: GameCenterLeaderboardFormatter? = nil,
                        formatterSuffix: String? = nil,
                        formatterSuffixSingular: String? = nil,
                        name: String? = nil)
            {
                self.formatterOverride = formatterOverride
                self.formatterSuffix = formatterSuffix
                self.formatterSuffixSingular = formatterSuffixSingular
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                formatterOverride = try container.decodeIfPresent(GameCenterLeaderboardFormatter.self, forKey: "formatterOverride")
                formatterSuffix = try container.decodeIfPresent(String.self, forKey: "formatterSuffix")
                formatterSuffixSingular = try container.decodeIfPresent(String.self, forKey: "formatterSuffixSingular")
                name = try container.decodeIfPresent(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(formatterOverride, forKey: "formatterOverride")
                try container.encodeIfPresent(formatterSuffix, forKey: "formatterSuffix")
                try container.encodeIfPresent(formatterSuffixSingular, forKey: "formatterSuffixSingular")
                try container.encodeIfPresent(name, forKey: "name")
            }
        }
    }
}
