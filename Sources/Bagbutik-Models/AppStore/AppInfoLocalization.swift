import Bagbutik_Core
import Foundation

/**
 # AppInfoLocalization
 The data structure that represent an App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization>
 */
public struct AppInfoLocalization: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appInfoLocalizations" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # AppInfoLocalization.Attributes
     Attributes that describe an App Info Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/attributes>
     */
    public struct Attributes: Codable {
        public var locale: String?
        public var name: String?
        public var privacyChoicesUrl: String?
        public var privacyPolicyText: String?
        public var privacyPolicyUrl: String?
        public var subtitle: String?

        public init(locale: String? = nil,
                    name: String? = nil,
                    privacyChoicesUrl: String? = nil,
                    privacyPolicyText: String? = nil,
                    privacyPolicyUrl: String? = nil,
                    subtitle: String? = nil)
        {
            self.locale = locale
            self.name = name
            self.privacyChoicesUrl = privacyChoicesUrl
            self.privacyPolicyText = privacyPolicyText
            self.privacyPolicyUrl = privacyPolicyUrl
            self.subtitle = subtitle
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            privacyChoicesUrl = try container.decodeIfPresent(String.self, forKey: "privacyChoicesUrl")
            privacyPolicyText = try container.decodeIfPresent(String.self, forKey: "privacyPolicyText")
            privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
            subtitle = try container.decodeIfPresent(String.self, forKey: "subtitle")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(privacyChoicesUrl, forKey: "privacyChoicesUrl")
            try container.encodeIfPresent(privacyPolicyText, forKey: "privacyPolicyText")
            try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
            try container.encodeIfPresent(subtitle, forKey: "subtitle")
        }
    }

    /**
     # AppInfoLocalization.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships>
     */
    public struct Relationships: Codable {
        public var appInfo: AppInfo?

        public init(appInfo: AppInfo? = nil) {
            self.appInfo = appInfo
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appInfo = try container.decodeIfPresent(AppInfo.self, forKey: "appInfo")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appInfo, forKey: "appInfo")
        }

        /**
         # AppInfoLocalization.Relationships.AppInfo
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo>
         */
        public struct AppInfo: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # AppInfoLocalization.Relationships.AppInfo.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appInfos" }

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

            /**
             # AppInfoLocalization.Relationships.AppInfo.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
