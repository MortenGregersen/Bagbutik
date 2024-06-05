import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionLocalizationCreateRequest
 The request body you use to create an App Store Version Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest>
 */
public struct AppStoreVersionLocalizationCreateRequest: Codable, RequestBody {
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
     # AppStoreVersionLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "appStoreVersionLocalizations" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        /**
         # AppStoreVersionLocalizationCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var description: String?
            public var keywords: String?
            public let locale: String
            public var marketingUrl: String?
            public var promotionalText: String?
            public var supportUrl: String?
            public var whatsNew: String?

            public init(description: String? = nil,
                        keywords: String? = nil,
                        locale: String,
                        marketingUrl: String? = nil,
                        promotionalText: String? = nil,
                        supportUrl: String? = nil,
                        whatsNew: String? = nil)
            {
                self.description = description
                self.keywords = keywords
                self.locale = locale
                self.marketingUrl = marketingUrl
                self.promotionalText = promotionalText
                self.supportUrl = supportUrl
                self.whatsNew = whatsNew
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                description = try container.decodeIfPresent(String.self, forKey: "description")
                keywords = try container.decodeIfPresent(String.self, forKey: "keywords")
                locale = try container.decode(String.self, forKey: "locale")
                marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
                promotionalText = try container.decodeIfPresent(String.self, forKey: "promotionalText")
                supportUrl = try container.decodeIfPresent(String.self, forKey: "supportUrl")
                whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(keywords, forKey: "keywords")
                try container.encode(locale, forKey: "locale")
                try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
                try container.encodeIfPresent(promotionalText, forKey: "promotionalText")
                try container.encodeIfPresent(supportUrl, forKey: "supportUrl")
                try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
            }
        }

        /**
         # AppStoreVersionLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appStoreVersion: AppStoreVersion

            public init(appStoreVersion: AppStoreVersion) {
                self.appStoreVersion = appStoreVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appStoreVersion = try container.decode(AppStoreVersion.self, forKey: "appStoreVersion")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(appStoreVersion, forKey: "appStoreVersion")
            }

            /**
             # AppStoreVersionLocalizationCreateRequest.Data.Relationships.AppStoreVersion
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest/data/relationships/appstoreversion>
             */
            public struct AppStoreVersion: Codable {
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
                 # AppStoreVersionLocalizationCreateRequest.Data.Relationships.AppStoreVersion.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationcreaterequest/data/relationships/appstoreversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appStoreVersions" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
    }
}
