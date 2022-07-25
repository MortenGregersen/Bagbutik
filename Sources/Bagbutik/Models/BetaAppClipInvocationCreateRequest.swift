import Foundation

/**
 The request body you use to create an App Clip invocation for testers.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest>
 */
public struct BetaAppClipInvocationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The relationship data to include in the response.
    public var included: [BetaAppClipInvocationLocalizationInlineCreate]?

    public init(data: Data, included: [BetaAppClipInvocationLocalizationInlineCreate]? = nil) {
        self.data = data
        self.included = included
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaAppClipInvocations" }
        /// The attributes that describes the request that creates a Beta App Clip Invocations resource.
        public let attributes: Attributes
        /// The navigational links to related data and included resource types and IDs.
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
         The attributes you set that describe the new Beta App Clip Invocations resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The invocation URL you configure for testers who use the TestFlight to launch your App Clip.
            public let url: String

            public init(url: String) {
                self.url = url
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Beta App Clip Invocation Localizations resource.
            public let betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations
            /// The related Build Bundles resource.
            public let buildBundle: BuildBundle

            public init(betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations, buildBundle: BuildBundle) {
                self.betaAppClipInvocationLocalizations = betaAppClipInvocationLocalizations
                self.buildBundle = buildBundle
            }

            /**
             The relationship to the Beta App Clip Invocation Localizations resource you set with the request that creates a Beta App Clip Invocations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/betaappclipinvocationlocalizations>
             */
            public struct BetaAppClipInvocationLocalizations: Codable {
                /// The ID and type of the related Beta App Clip Invocation Localizations resource.
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 The type and ID of the Beta App Clip Invocation Localizations resource that you’re relating with the Beta App Clip Invocations resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/betaappclipinvocationlocalizations/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the related Beta App Clip Invocation Localizations resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "betaAppClipInvocationLocalizations" }

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

            /**
             The relationship to the Build Bundles resource you set with the request that creates a Beta App Clip Invocations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/buildbundle>
             */
            public struct BuildBundle: Codable {
                /// The ID and type of the related Build Bundles resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the Build Bundles resource that you’re relating with the Beta App Clip Invocations resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/buildbundle/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the related Build Bundles resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "buildBundles" }

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
