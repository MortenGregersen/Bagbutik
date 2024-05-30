import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionLocalizationUpdateRequest
 The request body you use to update an App Store Version Localization

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest>
 */
public struct AppStoreVersionLocalizationUpdateRequest: Codable, RequestBody {
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
     # AppStoreVersionLocalizationUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "appStoreVersionLocalizations" }
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

        /**
         # AppStoreVersionLocalizationUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var description: String?
            public var keywords: String?
            public var marketingUrl: String?
            public var promotionalText: String?
            public var supportUrl: String?
            public var whatsNew: String?

            public init(description: String? = nil,
                        keywords: String? = nil,
                        marketingUrl: String? = nil,
                        promotionalText: String? = nil,
                        supportUrl: String? = nil,
                        whatsNew: String? = nil)
            {
                self.description = description
                self.keywords = keywords
                self.marketingUrl = marketingUrl
                self.promotionalText = promotionalText
                self.supportUrl = supportUrl
                self.whatsNew = whatsNew
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                description = try container.decodeIfPresent(String.self, forKey: "description")
                keywords = try container.decodeIfPresent(String.self, forKey: "keywords")
                marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
                promotionalText = try container.decodeIfPresent(String.self, forKey: "promotionalText")
                supportUrl = try container.decodeIfPresent(String.self, forKey: "supportUrl")
                whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(keywords, forKey: "keywords")
                try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
                try container.encodeIfPresent(promotionalText, forKey: "promotionalText")
                try container.encodeIfPresent(supportUrl, forKey: "supportUrl")
                try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
            }
        }
    }
}
