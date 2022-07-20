import Foundation

/**
 The request body you use to commit the image asset for an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimageupdaterequest>
 */
public struct AppClipAdvancedExperienceImageUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimageupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the request.
        public let id: String
        /// The resource type.
        public var type: String { "appClipAdvancedExperienceImages" }
        /// The attributes that describe the request that updates an Advanced App Clip Experience Images resource.
        public var attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
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
            case id
            case type
            case attributes
        }

        /**
         The attributes you set that describe the updated Advanced App Clip Experience Images resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimageupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A string that represents the MD5 checksum of the image asset you use for the App Clip card.
            public var sourceFileChecksum: String?
            /// A Boolean value that indicates whether you uploaded the image asset for an advanced App Clip experience.
            public var uploaded: Bool?

            public init(sourceFileChecksum: String? = nil, uploaded: Bool? = nil) {
                self.sourceFileChecksum = sourceFileChecksum
                self.uploaded = uploaded
            }
        }
    }
}
