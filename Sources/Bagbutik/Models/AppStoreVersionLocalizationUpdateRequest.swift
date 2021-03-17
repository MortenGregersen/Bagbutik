import Foundation

/**
 The request body you use to update an App Store Version Localization

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest>
 */
public struct AppStoreVersionLocalizationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreVersionLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes?

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
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let description: String?
            public let keywords: String?
            public let marketingUrl: String?
            public let promotionalText: String?
            public let supportUrl: String?
            public let whatsNew: String?

            public init(description: String? = nil, keywords: String? = nil, marketingUrl: String? = nil, promotionalText: String? = nil, supportUrl: String? = nil, whatsNew: String? = nil) {
                self.description = description
                self.keywords = keywords
                self.marketingUrl = marketingUrl
                self.promotionalText = promotionalText
                self.supportUrl = supportUrl
                self.whatsNew = whatsNew
            }
        }
    }
}
