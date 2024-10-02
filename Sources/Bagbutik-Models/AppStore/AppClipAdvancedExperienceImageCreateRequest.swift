import Bagbutik_Core
import Foundation

public struct AppClipAdvancedExperienceImageCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "appClipAdvancedExperienceImages" }
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
            public let fileName: String
            public let fileSize: Int

            public init(fileName: String,
                        fileSize: Int)
            {
                self.fileName = fileName
                self.fileSize = fileSize
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                fileName = try container.decode(String.self, forKey: "fileName")
                fileSize = try container.decode(Int.self, forKey: "fileSize")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(fileName, forKey: "fileName")
                try container.encode(fileSize, forKey: "fileSize")
            }
        }
    }
}
