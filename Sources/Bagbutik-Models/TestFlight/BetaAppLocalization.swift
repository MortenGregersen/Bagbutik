import Bagbutik_Core
import Foundation

/**
 # BetaAppLocalization
 The data structure that represents a Beta App Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization>
 */
public struct BetaAppLocalization: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaAppLocalizations" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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
     # BetaAppLocalization.Attributes
     Attributes that describe a Beta App Localizations resource.

     Table 1 lists allowed locale values.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// A description of your app that highlights features and functionality.
        public var description: String?
        /// An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.
        public var feedbackEmail: String?
        /// The specified locale. Refer to [Table 1](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers/beta_app_localizations/betaapplocalization/attributes#3042220) for possible values.
        public var locale: String?
        /// A URL with information about your app. This URL is visible to testers in the TestFlight app.
        public var marketingUrl: String?
        /// A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.
        public var privacyPolicyUrl: String?
        /// Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.
        public var tvOsPrivacyPolicy: String?

        public init(description: String? = nil,
                    feedbackEmail: String? = nil,
                    locale: String? = nil,
                    marketingUrl: String? = nil,
                    privacyPolicyUrl: String? = nil,
                    tvOsPrivacyPolicy: String? = nil)
        {
            self.description = description
            self.feedbackEmail = feedbackEmail
            self.locale = locale
            self.marketingUrl = marketingUrl
            self.privacyPolicyUrl = privacyPolicyUrl
            self.tvOsPrivacyPolicy = tvOsPrivacyPolicy
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            description = try container.decodeIfPresent(String.self, forKey: "description")
            feedbackEmail = try container.decodeIfPresent(String.self, forKey: "feedbackEmail")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
            privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
            tvOsPrivacyPolicy = try container.decodeIfPresent(String.self, forKey: "tvOsPrivacyPolicy")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(feedbackEmail, forKey: "feedbackEmail")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
            try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
            try container.encodeIfPresent(tvOsPrivacyPolicy, forKey: "tvOsPrivacyPolicy")
        }
    }

    /**
     # BetaAppLocalization.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization/relationships>
     */
    public struct Relationships: Codable, Sendable {
        public var app: App?

        public init(app: App? = nil) {
            self.app = app
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
        }

        /**
         # BetaAppLocalization.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization/relationships/app>
         */
        public struct App: Codable, Sendable {
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
             # BetaAppLocalization.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization/relationships/app/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "apps" }

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
             # BetaAppLocalization.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalization/relationships/app/links>
             */
            public struct Links: Codable, Sendable {
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
