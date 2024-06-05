import Bagbutik_Core
import Foundation

/**
 # BuildBundle
 The data structure that represents Build Bundles resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle>
 */
public struct BuildBundle: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Build Bundles resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "buildBundles" }
    /// The attributes that describe the Build Bundles resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # BuildBundle.Attributes
     The attributes that describe a Build Bundles resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/attributes>
     */
    public struct Attributes: Codable {
        /// The bundle ID of the build bundle.
        public var bundleId: String?
        /// The type of the build bundle.
        public var bundleType: BundleType?
        /// The URL to the symbolication file for the app or App Clip.
        public var dSYMUrl: String?
        /// The protocols that the app uses to communicate with external accessory hardware. For more information, see [UISupportedExternalAccessoryProtocols](https://developer.apple.com/documentation/bundleresources/information_property_list/uisupportedexternalaccessoryprotocols).
        public var deviceProtocols: [String]?
        /// Entitlement information for your app or App Clip.
        public var entitlements: [String: [String: String]]?
        /// The name of the build bundle.
        public var fileName: String?
        /// A Boolean value that indicates whether the build bundle contains on-demand resources.
        public var hasOnDemandResources: Bool?
        /// A Boolean value that indicates whether the build bundle contains a pre-rendered app icon.
        public var hasPrerenderedIcon: Bool?
        /// A Boolean value that indicates whether the build bundle contains an app or App Clip that allows users to interact with it through voice, intelligent suggestions, and personalized workflows.
        public var hasSirikit: Bool?
        /// A Boolean value that indicates whether the build bundle includes symbol information for debugging and crash reports.
        public var includesSymbols: Bool?
        /// A Boolean value that indicates whether an iOS app included in the build bundle is included on the Mac App Store.
        public var isIosBuildMacAppStoreCompatible: Bool?
        /// The specified locale. Refer to ``BetaAppLocalizationCreateRequest/Data/Attributes`` for possible values.
        public var locales: [String]?
        /// The build number of the OS you used to build the app or App Clip.
        public var platformBuild: String?
        /// An array of capabilities that your app or App Clip requires.
        public var requiredCapabilities: [String]?
        /// A string that identifies the SDK you used to build your app or App Clip.
        public var sdkBuild: String?
        /// An array of supported CPU architectures that your app or App Clip supports.
        public var supportedArchitectures: [String]?
        /// A Boolean value that indicates whether the app or App Clip included in the build bundle uses location services.
        public var usesLocationServices: Bool?

        public init(bundleId: String? = nil,
                    bundleType: BundleType? = nil,
                    dSYMUrl: String? = nil,
                    deviceProtocols: [String]? = nil,
                    entitlements: [String: [String: String]]? = nil,
                    fileName: String? = nil,
                    hasOnDemandResources: Bool? = nil,
                    hasPrerenderedIcon: Bool? = nil,
                    hasSirikit: Bool? = nil,
                    includesSymbols: Bool? = nil,
                    isIosBuildMacAppStoreCompatible: Bool? = nil,
                    locales: [String]? = nil,
                    platformBuild: String? = nil,
                    requiredCapabilities: [String]? = nil,
                    sdkBuild: String? = nil,
                    supportedArchitectures: [String]? = nil,
                    usesLocationServices: Bool? = nil)
        {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            bundleType = try container.decodeIfPresent(BundleType.self, forKey: "bundleType")
            dSYMUrl = try container.decodeIfPresent(String.self, forKey: "dSYMUrl")
            deviceProtocols = try container.decodeIfPresent([String].self, forKey: "deviceProtocols")
            entitlements = try container.decodeIfPresent([String: [String: String]].self, forKey: "entitlements")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            hasOnDemandResources = try container.decodeIfPresent(Bool.self, forKey: "hasOnDemandResources")
            hasPrerenderedIcon = try container.decodeIfPresent(Bool.self, forKey: "hasPrerenderedIcon")
            hasSirikit = try container.decodeIfPresent(Bool.self, forKey: "hasSirikit")
            includesSymbols = try container.decodeIfPresent(Bool.self, forKey: "includesSymbols")
            isIosBuildMacAppStoreCompatible = try container.decodeIfPresent(Bool.self, forKey: "isIosBuildMacAppStoreCompatible")
            locales = try container.decodeIfPresent([String].self, forKey: "locales")
            platformBuild = try container.decodeIfPresent(String.self, forKey: "platformBuild")
            requiredCapabilities = try container.decodeIfPresent([String].self, forKey: "requiredCapabilities")
            sdkBuild = try container.decodeIfPresent(String.self, forKey: "sdkBuild")
            supportedArchitectures = try container.decodeIfPresent([String].self, forKey: "supportedArchitectures")
            usesLocationServices = try container.decodeIfPresent(Bool.self, forKey: "usesLocationServices")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(bundleType, forKey: "bundleType")
            try container.encodeIfPresent(dSYMUrl, forKey: "dSYMUrl")
            try container.encodeIfPresent(deviceProtocols, forKey: "deviceProtocols")
            try container.encodeIfPresent(entitlements, forKey: "entitlements")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(hasOnDemandResources, forKey: "hasOnDemandResources")
            try container.encodeIfPresent(hasPrerenderedIcon, forKey: "hasPrerenderedIcon")
            try container.encodeIfPresent(hasSirikit, forKey: "hasSirikit")
            try container.encodeIfPresent(includesSymbols, forKey: "includesSymbols")
            try container.encodeIfPresent(isIosBuildMacAppStoreCompatible, forKey: "isIosBuildMacAppStoreCompatible")
            try container.encodeIfPresent(locales, forKey: "locales")
            try container.encodeIfPresent(platformBuild, forKey: "platformBuild")
            try container.encodeIfPresent(requiredCapabilities, forKey: "requiredCapabilities")
            try container.encodeIfPresent(sdkBuild, forKey: "sdkBuild")
            try container.encodeIfPresent(supportedArchitectures, forKey: "supportedArchitectures")
            try container.encodeIfPresent(usesLocationServices, forKey: "usesLocationServices")
        }

        public enum BundleType: String, Codable, CaseIterable {
            case app = "APP"
            case appClip = "APP_CLIP"
        }
    }

    /**
     # BuildBundle.Relationships
     The relationships of the Build Bundles resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships>
     */
    public struct Relationships: Codable {
        /// The related App Clip Domain Cache Statuses resource.
        public var appClipDomainCacheStatus: AppClipDomainCacheStatus?
        /// The related App Clip Domain Debug Statuses resource.
        public var appClipDomainDebugStatus: AppClipDomainDebugStatus?
        /// The related Beta App Clip Invocations resource.
        public var betaAppClipInvocations: BetaAppClipInvocations?
        /// The related Build Bundle File Sizes resource.
        public var buildBundleFileSizes: BuildBundleFileSizes?

        public init(appClipDomainCacheStatus: AppClipDomainCacheStatus? = nil,
                    appClipDomainDebugStatus: AppClipDomainDebugStatus? = nil,
                    betaAppClipInvocations: BetaAppClipInvocations? = nil,
                    buildBundleFileSizes: BuildBundleFileSizes? = nil)
        {
            self.appClipDomainCacheStatus = appClipDomainCacheStatus
            self.appClipDomainDebugStatus = appClipDomainDebugStatus
            self.betaAppClipInvocations = betaAppClipInvocations
            self.buildBundleFileSizes = buildBundleFileSizes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appClipDomainCacheStatus = try container.decodeIfPresent(AppClipDomainCacheStatus.self, forKey: "appClipDomainCacheStatus")
            appClipDomainDebugStatus = try container.decodeIfPresent(AppClipDomainDebugStatus.self, forKey: "appClipDomainDebugStatus")
            betaAppClipInvocations = try container.decodeIfPresent(BetaAppClipInvocations.self, forKey: "betaAppClipInvocations")
            buildBundleFileSizes = try container.decodeIfPresent(BuildBundleFileSizes.self, forKey: "buildBundleFileSizes")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appClipDomainCacheStatus, forKey: "appClipDomainCacheStatus")
            try container.encodeIfPresent(appClipDomainDebugStatus, forKey: "appClipDomainDebugStatus")
            try container.encodeIfPresent(betaAppClipInvocations, forKey: "betaAppClipInvocations")
            try container.encodeIfPresent(buildBundleFileSizes, forKey: "buildBundleFileSizes")
        }

        /**
         # BuildBundle.Relationships.AppClipDomainCacheStatus
         The data and links that describe the relationship between the Build Bundles and the App Clip Domain Cache Statuses resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus>
         */
        public struct AppClipDomainCacheStatus: Codable {
            /// The ID and type of the related App Clip Domain Cache Status resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # BuildBundle.Relationships.AppClipDomainCacheStatus.Data
             The type and ID of a related App Clip Domain Cache Status resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Clip Domain Cache Statuses resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDomainStatuses" }

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

            /**
             # BuildBundle.Relationships.AppClipDomainCacheStatus.Links
             The type and ID of a related App Clip Domain Cache Status resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaincachestatus/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # BuildBundle.Relationships.AppClipDomainDebugStatus
         The data and links that describe the relationship between the Build Bundles and the App Clip Domain Debug Statuses resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus>
         */
        public struct AppClipDomainDebugStatus: Codable {
            /// The ID and type of the related App Clip Domain Debug Status resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # BuildBundle.Relationships.AppClipDomainDebugStatus.Data
             The type and ID of a related App Clip Domain Debug Status resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Clip Domain Debug Statuses resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDomainStatuses" }

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

            /**
             # BuildBundle.Relationships.AppClipDomainDebugStatus.Links
             The type and ID of a related App Clip Domain Debug Status resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/appclipdomaindebugstatus/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # BuildBundle.Relationships.BetaAppClipInvocations
         The data, links, and paging information that describe the relationship between the Build Bundles and the Beta App Clip Invocations resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations>
         */
        public struct BetaAppClipInvocations: Codable {
            /// The ID and type of the related Beta App Clip Invocations resource.
            @NullCodable public var data: [Data]?
            /// Navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # BuildBundle.Relationships.BetaAppClipInvocations.Data
             The type and ID of a related Beta App Clip Invocations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations/data>
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

            /**
             # BuildBundle.Relationships.BetaAppClipInvocations.Links
             The type and ID of a related Beta App Clip Invocations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/betaappclipinvocations/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # BuildBundle.Relationships.BuildBundleFileSizes
         The data, links, and paging information that describe the relationship between the Build Bundles and the Build Bundle File Sizes resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes>
         */
        public struct BuildBundleFileSizes: Codable {
            /// The ID and type of the related Build Bundle File Sizes resource.
            @NullCodable public var data: [Data]?
            /// Navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # BuildBundle.Relationships.BuildBundleFileSizes.Data
             The type and ID of a related Build Bundle File Sizes resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Build Bundle File Sizes resource.
                public let id: String
                /// The resource type.
                public var type: String { "buildBundleFileSizes" }

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

            /**
             # BuildBundle.Relationships.BuildBundleFileSizes.Links
             The type and ID of a related Build Bundle File Sizes resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle/relationships/buildbundlefilesizes/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
