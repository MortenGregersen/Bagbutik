import Foundation

/**
 The request body you use to create an App Clip invocation for testers.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest>
 */
public struct BetaAppClipInvocationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The included related resources.
    public let included: [BetaAppClipInvocationLocalizationInlineCreate]?

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
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes that you set that describe the new resource.

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
            public let betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations
            public let buildBundle: BuildBundle

            public init(betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations, buildBundle: BuildBundle) {
                self.betaAppClipInvocationLocalizations = betaAppClipInvocationLocalizations
                self.buildBundle = buildBundle
            }

            public struct BetaAppClipInvocationLocalizations: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/betaappclipinvocationlocalizations/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "betaAppClipInvocationLocalizations" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct BuildBundle: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationcreaterequest/data/relationships/buildbundle/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "buildBundles" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}