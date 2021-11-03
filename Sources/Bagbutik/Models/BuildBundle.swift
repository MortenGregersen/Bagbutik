import Foundation

/**
 The data structure that represents Build Bundles resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle>
 */
public struct BuildBundle: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildBundles" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe a Build Bundles resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/attributes>
     */
    public struct Attributes: Codable {
        /// The bundle ID of the build bundle.
        public let bundleId: String?
        /// The type of the build bundle.
        public let bundleType: BundleType?
        /// The URL to the symbolication file for the app or App Clip.
        public let dSYMUrl: String?
        /// The protocols that the app uses to communicate with external accessory hardware. For more information, see UISupportedExternalAccessoryProtocols.
        public let deviceProtocols: String?
        /// Entitlement information for your app or App Clip.
        public let entitlements: [String: [String: String]]?
        /// The name of the build bundle.
        public let fileName: String?
        /// A Boolean value that indicates whether the build bundle contains on-demand resources.
        public let hasOnDemandResources: Bool?
        /// A Boolean value that indicates whether the build bundle contains a pre-rendered app icon.
        public let hasPrerenderedIcon: Bool?
        /// A Boolean value that indicates whether the build bundle contains an app or App Clip that allows users to interact with it through voice, intelligent suggestions, and personalized workflows.
        public let hasSirikit: Bool?
        /// A Boolean value that indicates whether the build bundle includes symbol information for debugging and crash reports.
        public let includesSymbols: Bool?
        /// A Boolean value that indicates whether an iOS app included in the build bundle is included on the Mac App Store.
        public let isIosBuildMacAppStoreCompatible: Bool?
        /// The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.
        public let locales: String?
        /// The build number of the OS you used to build the app or App Clip.
        public let platformBuild: String?
        /// An array of capabilities that your app or App Clip requires.
        public let requiredCapabilities: String?
        /// A string that identifies the SDK you used to build your app or App Clip.
        public let sdkBuild: String?
        /// An array of supported CPU architectures that your app or App Clip supports.
        public let supportedArchitectures: String?
        /// A Boolean value that indicates whether the app or App Clip included in the build bundle uses location services.
        public let usesLocationServices: Bool?

        public init(bundleId: String? = nil, bundleType: BundleType? = nil, dSYMUrl: String? = nil, deviceProtocols: String? = nil, entitlements: [String: [String: String]]? = nil, fileName: String? = nil, hasOnDemandResources: Bool? = nil, hasPrerenderedIcon: Bool? = nil, hasSirikit: Bool? = nil, includesSymbols: Bool? = nil, isIosBuildMacAppStoreCompatible: Bool? = nil, locales: String? = nil, platformBuild: String? = nil, requiredCapabilities: String? = nil, sdkBuild: String? = nil, supportedArchitectures: String? = nil, usesLocationServices: Bool? = nil) {
            self.bundleId = bundleId
            self.bundleType = bundleType
            self.dSYMUrl = dSYMUrl
            self.deviceProtocols = deviceProtocols
            self.entitlements = entitlements
            self.fileName = fileName
            self.hasOnDemandResources = hasOnDemandResources
            self.hasPrerenderedIcon = hasPrerenderedIcon
            self.hasSirikit = hasSirikit
            self.includesSymbols = includesSymbols
            self.isIosBuildMacAppStoreCompatible = isIosBuildMacAppStoreCompatible
            self.locales = locales
            self.platformBuild = platformBuild
            self.requiredCapabilities = requiredCapabilities
            self.sdkBuild = sdkBuild
            self.supportedArchitectures = supportedArchitectures
            self.usesLocationServices = usesLocationServices
        }

        public enum BundleType: String, Codable, CaseIterable {
            case app = "APP"
            case appClip = "APP_CLIP"
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships>
     */
    public struct Relationships: Codable {
        public let appClipDomainCacheStatus: AppClipDomainCacheStatus?
        public let appClipDomainDebugStatus: AppClipDomainDebugStatus?
        public let betaAppClipInvocations: BetaAppClipInvocations?
        public let buildBundleFileSizes: BuildBundleFileSizes?

        public init(appClipDomainCacheStatus: AppClipDomainCacheStatus? = nil, appClipDomainDebugStatus: AppClipDomainDebugStatus? = nil, betaAppClipInvocations: BetaAppClipInvocations? = nil, buildBundleFileSizes: BuildBundleFileSizes? = nil) {
            self.appClipDomainCacheStatus = appClipDomainCacheStatus
            self.appClipDomainDebugStatus = appClipDomainDebugStatus
            self.betaAppClipInvocations = betaAppClipInvocations
            self.buildBundleFileSizes = buildBundleFileSizes
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus>
         */
        public struct AppClipDomainCacheStatus: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDomainStatuses" }

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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus>
         */
        public struct AppClipDomainDebugStatus: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDomainStatuses" }

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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations>
         */
        public struct BetaAppClipInvocations: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations/data>
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes>
         */
        public struct BuildBundleFileSizes: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "buildBundleFileSizes" }

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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
