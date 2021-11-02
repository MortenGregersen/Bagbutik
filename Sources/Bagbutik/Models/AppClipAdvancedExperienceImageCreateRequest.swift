import Foundation

public struct AppClipAdvancedExperienceImageCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimagecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipAdvancedExperienceImages" }
        /// The resource's attributes.
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
            case type
            case attributes
        }

        public struct Attributes: Codable {
            public let fileName: String
            public let fileSize: Int

            public init(fileName: String, fileSize: Int) {
                self.fileName = fileName
                self.fileSize = fileSize
            }
        }
    }
}
