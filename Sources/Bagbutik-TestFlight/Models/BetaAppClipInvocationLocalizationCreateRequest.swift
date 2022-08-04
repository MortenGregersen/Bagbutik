import Foundation
import Bagbutik_Core

/**
 # BetaAppClipInvocationLocalizationCreateRequest
 The request body you use to create a Beta App Clip Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest>
 */
public struct BetaAppClipInvocationLocalizationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # BetaAppClipInvocationLocalizationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaAppClipInvocationLocalizations" }
        /// The attributes that describes the request that creates a Beta App Clip Invocation Localizations resource.
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
         # BetaAppClipInvocationLocalizationCreateRequest.Data.Attributes
         The attributes you set that describe the new Beta App Clip Invocation Localizations resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The specified locale. Refer to ``BetaAppLocalizationCreateRequest/Data/Attributes`` for possible values.
            public let locale: String
            /// The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.
            public let title: String

            public init(locale: String,
                        title: String)
            {
                self.locale = locale
                self.title = title
            }
        }

        /**
         # BetaAppClipInvocationLocalizationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Beta App Clip Invocations resource.
            public let betaAppClipInvocation: BetaAppClipInvocation

            public init(betaAppClipInvocation: BetaAppClipInvocation) {
                self.betaAppClipInvocation = betaAppClipInvocation
            }

            /**
             # BetaAppClipInvocationLocalizationCreateRequest.Data.Relationships.BetaAppClipInvocation
             The relationship to the Beta App Clip Invocations resource you set with the request that creates a Beta App Clip Invocation Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest/data/relationships/betaappclipinvocation>
             */
            public struct BetaAppClipInvocation: Codable {
                /// The ID and type of the related Beta App Clip Invocations resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # BetaAppClipInvocationLocalizationCreateRequest.Data.Relationships.BetaAppClipInvocation.Data
                 The type and ID of the Beta App Clip Invocations resource that you’re relating with the Beta App Clip Invocation Localizations resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationcreaterequest/data/relationships/betaappclipinvocation/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Beta App Clip Invocations resource.
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
}
