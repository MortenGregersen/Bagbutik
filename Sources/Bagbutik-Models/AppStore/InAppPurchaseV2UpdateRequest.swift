import Bagbutik_Core
import Foundation

public struct InAppPurchaseV2UpdateRequest: Codable, RequestBody {
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
        public var type: String { "inAppPurchases" }
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
            public var familySharable: Bool?
            public var name: String?
            public var reviewNote: String?

            public init(familySharable: Bool? = nil,
                        name: String? = nil,
                        reviewNote: String? = nil)
            {
                self.familySharable = familySharable
                self.name = name
                self.reviewNote = reviewNote
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                familySharable = try container.decodeIfPresent(Bool.self, forKey: .familySharable)
                name = try container.decodeIfPresent(String.self, forKey: .name)
                reviewNote = try container.decodeIfPresent(String.self, forKey: .reviewNote)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(familySharable, forKey: .familySharable)
                try container.encodeIfPresent(name, forKey: .name)
                try container.encodeIfPresent(reviewNote, forKey: .reviewNote)
            }

            private enum CodingKeys: String, CodingKey {
                case familySharable
                case name
                case reviewNote
            }
        }
    }
}
