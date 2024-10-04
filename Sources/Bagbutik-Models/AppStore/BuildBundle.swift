import Bagbutik_Core
import Foundation

/**
 # BuildBundle
 The data structure that represents Build Bundles resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundle>
 */
public struct BuildBundle: Codable, Sendable, Identifiable {
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

    public struct Attributes: Codable, Sendable {
        public var bundleId: String?
        public var bundleType: BundleType?
        public var dSYMUrl: String?
        public var deviceProtocols: [String]?
        public var entitlements: [String: [String: String]]?
        public var fileName: String?
        public var hasOnDemandResources: Bool?
        public var hasPrerenderedIcon: Bool?
        public var hasSirikit: Bool?
        public var includesSymbols: Bool?
        public var isIosBuildMacAppStoreCompatible: Bool?
        public var locales: [String]?
        public var platformBuild: String?
        public var requiredCapabilities: [String]?
        public var sdkBuild: String?
        public var supportedArchitectures: [String]?
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

        public enum BundleType: String, Sendable, Codable, CaseIterable {
            case app = "APP"
            case appClip = "APP_CLIP"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appClipDomainCacheStatus: AppClipDomainCacheStatus?
        public var appClipDomainDebugStatus: AppClipDomainDebugStatus?
        public var betaAppClipInvocations: BetaAppClipInvocations?
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

        public struct AppClipDomainCacheStatus: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
        }

        public struct AppClipDomainDebugStatus: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
        }

        public struct BetaAppClipInvocations: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
        }

        public struct BuildBundleFileSizes: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
        }
    }
}
