import Foundation

/**
 The request body you use to create a Beta App Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest>
 */
public struct BetaAppLocalizationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaAppLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// Navigational links to related data and included resource types and IDs.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
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
            case type
            case attributes
            case relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/attributes>

         Table 1 lists allowed locale values.
         */
        public struct Attributes: Codable {
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

            public init(description: String? = nil, feedbackEmail: String? = nil, locale: String, marketingUrl: String? = nil, privacyPolicyUrl: String? = nil, tvOsPrivacyPolicy: String? = nil) {
                self.description = description
                self.feedbackEmail = feedbackEmail
                self.locale = locale
                self.marketingUrl = marketingUrl
                self.privacyPolicyUrl = privacyPolicyUrl
                self.tvOsPrivacyPolicy = tvOsPrivacyPolicy
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            /**
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships/app>
             */
            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationcreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "apps" }

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
