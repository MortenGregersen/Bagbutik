import Bagbutik_Core
import Foundation

/**
 # BetaBuildLocalizationCreateRequest
 The request body you use to create a Beta Build Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest>
 */
public struct BetaBuildLocalizationCreateRequest: Codable, RequestBody {
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
     # BetaBuildLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaBuildLocalizations" }
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
         # BetaBuildLocalizationCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Table 1 lists allowed locale values.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The specified locale. Refer to [Table 1](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers/beta_build_localizations/betabuildlocalizationcreaterequest/data/attributes#3073798) for possible values.
            public let locale: String
            /// A field that describes changes and additions to a build and indicates features you would like your users to test.
            public var whatsNew: String?

            public init(locale: String,
                        whatsNew: String? = nil)
            {
                self.locale = locale
                self.whatsNew = whatsNew
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                locale = try container.decode(String.self, forKey: "locale")
                whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(locale, forKey: "locale")
                try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
            }
        }

        /**
         # BetaBuildLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let build: Build

            public init(build: Build) {
                self.build = build
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                build = try container.decode(Build.self, forKey: "build")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(build, forKey: "build")
            }

            /**
             # BetaBuildLocalizationCreateRequest.Data.Relationships.Build
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest/data/relationships/build>
             */
            public struct Build: Codable {
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
                 # BetaBuildLocalizationCreateRequest.Data.Relationships.Build.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationcreaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

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
