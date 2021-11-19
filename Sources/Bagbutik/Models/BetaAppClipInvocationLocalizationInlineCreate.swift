import Foundation

/**
 The data structure that represents a Beta App Clip Invocation Localization Inline Creates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationinlinecreate>
 */
public struct BetaAppClipInvocationLocalizationInlineCreate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String?
    /// The resource type.
    public var type: String { "betaAppClipInvocationLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String? = nil, attributes: Attributes, relationships: Relationships? = nil) {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        attributes = try container.decode(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe a Beta App Clip Invocation Localization Inline Creates resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationinlinecreate/attributes>
     */
    public struct Attributes: Codable {
        /// The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.
        public let locale: String
        /// The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.
        public let title: String

        public init(locale: String, title: String) {
            self.locale = locale
            self.title = title
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationinlinecreate/relationships>
     */
    public struct Relationships: Codable {
        public let betaAppClipInvocation: BetaAppClipInvocation?

        public init(betaAppClipInvocation: BetaAppClipInvocation? = nil) {
            self.betaAppClipInvocation = betaAppClipInvocation
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationinlinecreate/relationships/betaappclipinvocation>
         */
        public struct BetaAppClipInvocation: Codable {
            /// The type and ID of a related resource.
            public let data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationinlinecreate/relationships/betaappclipinvocation/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "betaAppClipInvocations" }

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
