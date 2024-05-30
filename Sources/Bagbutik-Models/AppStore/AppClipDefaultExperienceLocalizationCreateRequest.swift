import Bagbutik_Core
import Foundation

/**
 # AppClipDefaultExperienceLocalizationCreateRequest
 The request body you use to create a Default App Clip Experience Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest>
 */
public struct AppClipDefaultExperienceLocalizationCreateRequest: Codable, RequestBody {
    /// The resource data.
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
     # AppClipDefaultExperienceLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipDefaultExperienceLocalizations" }
        /// The attributes that describes the request that creates a Default App Clip Experience Localizations resource.
        public let attributes: Attributes
        /// The navigational links to related data and included resource types and IDs.
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
         # AppClipDefaultExperienceLocalizationCreateRequest.Data.Attributes
         The attributes you set that describe the Default App Clip Experience Localizations resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The specified locale.
            public let locale: String
            /// The subtitle that appears on the App Clip card for the default App Clip experience.
            public var subtitle: String?

            public init(locale: String,
                        subtitle: String? = nil)
            {
                self.locale = locale
                self.subtitle = subtitle
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                locale = try container.decode(String.self, forKey: .locale)
                subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(locale, forKey: .locale)
                try container.encodeIfPresent(subtitle, forKey: .subtitle)
            }

            private enum CodingKeys: String, CodingKey {
                case locale
                case subtitle
            }
        }

        /**
         # AppClipDefaultExperienceLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Default App Clip Experiences resource.
            public let appClipDefaultExperience: AppClipDefaultExperience

            public init(appClipDefaultExperience: AppClipDefaultExperience) {
                self.appClipDefaultExperience = appClipDefaultExperience
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                appClipDefaultExperience = try container.decode(AppClipDefaultExperience.self, forKey: .appClipDefaultExperience)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(appClipDefaultExperience, forKey: .appClipDefaultExperience)
            }

            private enum CodingKeys: String, CodingKey {
                case appClipDefaultExperience
            }

            /**
             # AppClipDefaultExperienceLocalizationCreateRequest.Data.Relationships.AppClipDefaultExperience
             The relationship to the Default App Clip Experiences resource you set with the request that creates a Default App Clip Experience Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/relationships/appclipdefaultexperience>
             */
            public struct AppClipDefaultExperience: Codable {
                /// The ID and type of the related Default App Clip Experiences resource.
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
                 # AppClipDefaultExperienceLocalizationCreateRequest.Data.Relationships.AppClipDefaultExperience.Data
                 The type and ID of the Default App Clip Experiences resource that you’re relating with the Default App Clip Experience Localizations resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/relationships/appclipdefaultexperience/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Default App Clip Experiences resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperiences" }

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
