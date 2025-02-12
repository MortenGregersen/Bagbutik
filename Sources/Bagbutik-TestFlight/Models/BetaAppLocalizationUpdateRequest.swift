import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaAppLocalizationUpdateRequest
 The request body you use to update a Beta App Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationupdaterequest>
 */
public struct BetaAppLocalizationUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "betaAppLocalizations" }
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

        public struct Attributes: Codable, Sendable {
            public var description: String?
            public var feedbackEmail: String?
            public var marketingUrl: String?
            public var privacyPolicyUrl: String?
            public var tvOsPrivacyPolicy: String?

            public init(description: String? = nil,
                        feedbackEmail: String? = nil,
                        marketingUrl: String? = nil,
                        privacyPolicyUrl: String? = nil,
                        tvOsPrivacyPolicy: String? = nil)
            {
                self.description = description
                self.feedbackEmail = feedbackEmail
                self.marketingUrl = marketingUrl
                self.privacyPolicyUrl = privacyPolicyUrl
                self.tvOsPrivacyPolicy = tvOsPrivacyPolicy
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                description = try container.decodeIfPresent(String.self, forKey: "description")
                feedbackEmail = try container.decodeIfPresent(String.self, forKey: "feedbackEmail")
                marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
                privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
                tvOsPrivacyPolicy = try container.decodeIfPresent(String.self, forKey: "tvOsPrivacyPolicy")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(feedbackEmail, forKey: "feedbackEmail")
                try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
                try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
                try container.encodeIfPresent(tvOsPrivacyPolicy, forKey: "tvOsPrivacyPolicy")
            }
        }
    }
}
