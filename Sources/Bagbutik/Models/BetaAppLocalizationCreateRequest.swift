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
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
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
         */
        public struct Attributes: Codable {
            /// A description of your app that highlights features and functionality.
            public let description: String?
            /// An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.
            public let feedbackEmail: String?
            /// The specified locale. Refer to Table 1 for possible values.
            public let locale: String
            /// A URL with information about your app. This URL is visible to testers in the TestFlight app.
            public let marketingUrl: String?
            /// A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.
            public let privacyPolicyUrl: String?
            /// Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.
            public let tvOsPrivacyPolicy: String?

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

            public struct App: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
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
