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
        }

        public struct Relationships: Codable {
            public let appInfo: AppInfo

            public init(appInfo: AppInfo) {
                self.appInfo = appInfo
            }

            public struct AppInfo: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

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
