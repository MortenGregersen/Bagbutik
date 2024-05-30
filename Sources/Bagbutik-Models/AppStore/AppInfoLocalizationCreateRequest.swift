import Bagbutik_Core
import Foundation

/**
 # AppInfoLocalizationCreateRequest
 The request body you use to create an App Info Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest>
 */
public struct AppInfoLocalizationCreateRequest: Codable, RequestBody {
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

    /**
     # AppInfoLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "appInfoLocalizations" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AppInfoLocalizationCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let locale: String
            public var name: String?
            public var privacyChoicesUrl: String?
            public var privacyPolicyText: String?
            public var privacyPolicyUrl: String?
            public var subtitle: String?

            public init(locale: String,
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                locale = try container.decode(String.self, forKey: .locale)
                name = try container.decodeIfPresent(String.self, forKey: .name)
                privacyChoicesUrl = try container.decodeIfPresent(String.self, forKey: .privacyChoicesUrl)
                privacyPolicyText = try container.decodeIfPresent(String.self, forKey: .privacyPolicyText)
                privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: .privacyPolicyUrl)
                subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(locale, forKey: .locale)
                try container.encodeIfPresent(name, forKey: .name)
                try container.encodeIfPresent(privacyChoicesUrl, forKey: .privacyChoicesUrl)
                try container.encodeIfPresent(privacyPolicyText, forKey: .privacyPolicyText)
                try container.encodeIfPresent(privacyPolicyUrl, forKey: .privacyPolicyUrl)
                try container.encodeIfPresent(subtitle, forKey: .subtitle)
            }

            private enum CodingKeys: String, CodingKey {
                case locale
                case name
                case privacyChoicesUrl
                case privacyPolicyText
                case privacyPolicyUrl
                case subtitle
            }
        }

        /**
         # AppInfoLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appInfo: AppInfo

            public init(appInfo: AppInfo) {
                self.appInfo = appInfo
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                appInfo = try container.decode(AppInfo.self, forKey: .appInfo)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(appInfo, forKey: .appInfo)
            }

            private enum CodingKeys: String, CodingKey {
                case appInfo
            }

            /**
             # AppInfoLocalizationCreateRequest.Data.Relationships.AppInfo
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest/data/relationships/appinfo>
             */
            public struct AppInfo: Codable {
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

                /**
                 # AppInfoLocalizationCreateRequest.Data.Relationships.AppInfo.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationcreaterequest/data/relationships/appinfo/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appInfos" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
