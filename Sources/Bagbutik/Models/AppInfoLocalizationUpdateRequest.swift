import Foundation

/**
 The request body you use to update an App Info Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationupdaterequest>
 */
public struct AppInfoLocalizationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public let id: String
        public var type: String { "appInfoLocalizations" }
        ///
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
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
        }

        public struct Attributes: Codable {
            public var name: String?
            public var privacyChoicesUrl: String?
            public var privacyPolicyText: String?
            public var privacyPolicyUrl: String?
            public var subtitle: String?

            public init(name: String? = nil, privacyChoicesUrl: String? = nil, privacyPolicyText: String? = nil, privacyPolicyUrl: String? = nil, subtitle: String? = nil) {
                self.name = name
                self.privacyChoicesUrl = privacyChoicesUrl
                self.privacyPolicyText = privacyPolicyText
                self.privacyPolicyUrl = privacyPolicyUrl
                self.subtitle = subtitle
            }
        }
    }
}
