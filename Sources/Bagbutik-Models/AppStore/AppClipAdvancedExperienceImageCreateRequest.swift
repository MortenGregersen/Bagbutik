import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceImageCreateRequest
 The request body you use to reserve an image asset for an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimagecreaterequest>
 */
public struct AppClipAdvancedExperienceImageCreateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
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

    /**
     # AppClipAdvancedExperienceImageCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimagecreaterequest/data>
     */
    public struct Data: Codable, Sendable {
        /// The resource type.
        public var type: String { "appClipAdvancedExperienceImages" }
        /// The attributes that describe the request that creates an Advanced App Clip Experience Images resource.
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

        /**
         # AppClipAdvancedExperienceImageCreateRequest.Data.Attributes
         The attributes you set that describe the new Advanced App Clip Experience Images resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimagecreaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// The filename of the image asset that appears on the App Clip card for the advanced App Clip experience.
            public let fileName: String
            /// The size of the image asset that appears on the App Clip card for the advanced App Clip experience.
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
