import Bagbutik_Core
import Foundation

/**
 # BetaAppLocalizationCreateRequest
 The request body you use to create a Beta App Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest>
 */
public struct BetaAppLocalizationCreateRequest: Codable, Sendable, RequestBody {
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

    /**
     # BetaAppLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data>
     */
    public struct Data: Codable, Sendable {
        /// The resource type.
        public var type: String { "betaAppLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// Navigational links to related data and included resource types and IDs.
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
         # BetaAppLocalizationCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Table 1 lists allowed locale values.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// A description of your app that highlights features and functionality.
            public var description: String?
            /// An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.
            public var feedbackEmail: String?
            /// The specified locale. Refer to [Table 1](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers/beta_app_localizations/betaapplocalizationcreaterequest/data/attributes#3080183) for possible values.
            public let locale: String
            /// A URL with information about your app. This URL is visible to testers in the TestFlight app.
            public var marketingUrl: String?
            /// A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.
            public var privacyPolicyUrl: String?
            /// Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.
            public var tvOsPrivacyPolicy: String?

            public init(description: String? = nil,
                        feedbackEmail: String? = nil,
                        locale: String,
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
                locale = try container.decode(String.self, forKey: "locale")
                marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
                privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
                tvOsPrivacyPolicy = try container.decodeIfPresent(String.self, forKey: "tvOsPrivacyPolicy")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(feedbackEmail, forKey: "feedbackEmail")
                try container.encode(locale, forKey: "locale")
                try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
                try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
                try container.encodeIfPresent(tvOsPrivacyPolicy, forKey: "tvOsPrivacyPolicy")
            }
        }

        /**
         # BetaAppLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable, Sendable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decode(App.self, forKey: "app")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(app, forKey: "app")
            }

            /**
             # BetaAppLocalizationCreateRequest.Data.Relationships.App
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships/app>
             */
            public struct App: Codable, Sendable {
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
                 # BetaAppLocalizationCreateRequest.Data.Relationships.App.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships/app/data>
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
            }
        }
    }
}
