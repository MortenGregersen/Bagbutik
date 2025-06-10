import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct ReviewSubmissionUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "reviewSubmissions" }
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
            public var canceled: Bool?
            public var platform: Platform?
            public var submitted: Bool?

            public init(canceled: Bool? = nil,
                        platform: Platform? = nil,
                        submitted: Bool? = nil)
            {
                self.canceled = canceled
                self.platform = platform
                self.submitted = submitted
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                canceled = try container.decodeIfPresent(Bool.self, forKey: "canceled")
                platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
                submitted = try container.decodeIfPresent(Bool.self, forKey: "submitted")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(canceled, forKey: "canceled")
                try container.encodeIfPresent(platform, forKey: "platform")
                try container.encodeIfPresent(submitted, forKey: "submitted")
            }
        }
    }
}
