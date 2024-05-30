import Bagbutik_Core
import Foundation

public struct GameCenterAchievementLocalizationUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
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
        public var type: String { "gameCenterAchievementLocalizations" }
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
            public var afterEarnedDescription: String?
            public var beforeEarnedDescription: String?
            public var name: String?

            public init(afterEarnedDescription: String? = nil,
                        beforeEarnedDescription: String? = nil,
                        name: String? = nil)
            {
                self.afterEarnedDescription = afterEarnedDescription
                self.beforeEarnedDescription = beforeEarnedDescription
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                afterEarnedDescription = try container.decodeIfPresent(String.self, forKey: .afterEarnedDescription)
                beforeEarnedDescription = try container.decodeIfPresent(String.self, forKey: .beforeEarnedDescription)
                name = try container.decodeIfPresent(String.self, forKey: .name)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(afterEarnedDescription, forKey: .afterEarnedDescription)
                try container.encodeIfPresent(beforeEarnedDescription, forKey: .beforeEarnedDescription)
                try container.encodeIfPresent(name, forKey: .name)
            }

            private enum CodingKeys: String, CodingKey {
                case afterEarnedDescription
                case beforeEarnedDescription
                case name
            }
        }
    }
}
