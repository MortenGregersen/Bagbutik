import Bagbutik_Core
import Foundation

/**
 # App
 The data structure that represents an Apps resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/app>
 */
public struct App: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "apps" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
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
        case attributes
        case id
        case links
        case relationships
        case type
    }

    public struct Attributes: Codable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var availableInNewTerritories: Bool? = nil
        public var bundleId: String?
        public var contentRightsDeclaration: ContentRightsDeclaration?
        public var isOrEverWasMadeForKids: Bool?
        public var name: String?
        public var primaryLocale: String?
        public var sku: String?
        public var subscriptionStatusUrl: String?
        public var subscriptionStatusUrlForSandbox: String?
        public var subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion?
        public var subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(availableInNewTerritories: Bool? = nil,
                    bundleId: String? = nil,
                    contentRightsDeclaration: ContentRightsDeclaration? = nil,
                    isOrEverWasMadeForKids: Bool? = nil,
                    name: String? = nil,
                    primaryLocale: String? = nil,
                    sku: String? = nil,
                    subscriptionStatusUrl: String? = nil,
                    subscriptionStatusUrlForSandbox: String? = nil,
                    subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                    subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
        {
            self.availableInNewTerritories = availableInNewTerritories
            self.bundleId = bundleId
            self.contentRightsDeclaration = contentRightsDeclaration
            self.isOrEverWasMadeForKids = isOrEverWasMadeForKids
            self.name = name
            self.primaryLocale = primaryLocale
            self.sku = sku
            self.subscriptionStatusUrl = subscriptionStatusUrl
            self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
            self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
            self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
        }

        public init(bundleId: String? = nil,
                    contentRightsDeclaration: ContentRightsDeclaration? = nil,
                    isOrEverWasMadeForKids: Bool? = nil,
                    name: String? = nil,
                    primaryLocale: String? = nil,
                    sku: String? = nil,
                    subscriptionStatusUrl: String? = nil,
                    subscriptionStatusUrlForSandbox: String? = nil,
                    subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                    subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
        {
            self.bundleId = bundleId
            self.contentRightsDeclaration = contentRightsDeclaration
            self.isOrEverWasMadeForKids = isOrEverWasMadeForKids
            self.name = name
            self.primaryLocale = primaryLocale
            self.sku = sku
            self.subscriptionStatusUrl = subscriptionStatusUrl
            self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
            self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
            self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
        }

        public enum ContentRightsDeclaration: String, Codable, CaseIterable {
            case doesNotUseThirdPartyContent = "DOES_NOT_USE_THIRD_PARTY_CONTENT"
            case usesThirdPartyContent = "USES_THIRD_PARTY_CONTENT"
        }
    }

    public struct Relationships: Codable {
        public var appClips: AppClips?
        public var appCustomProductPages: AppCustomProductPages?
        public var appEvents: AppEvents?
        public var appInfos: AppInfos?
        public var appStoreVersions: AppStoreVersions?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var availableTerritories: AvailableTerritories? = nil
        public var betaAppLocalizations: BetaAppLocalizations?
        public var betaAppReviewDetail: BetaAppReviewDetail?
        public var betaGroups: BetaGroups?
        public var betaLicenseAgreement: BetaLicenseAgreement?
        public var builds: Builds?
        public var ciProduct: CiProduct?
        public var endUserLicenseAgreement: EndUserLicenseAgreement?
        public var gameCenterEnabledVersions: GameCenterEnabledVersions?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var inAppPurchases: InAppPurchases? = nil
        public var inAppPurchasesV2: InAppPurchasesV2?
        public var preOrder: PreOrder?
        public var preReleaseVersions: PreReleaseVersions?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var prices: Prices? = nil
        public var promotedPurchases: PromotedPurchases?
        public var reviewSubmissions: ReviewSubmissions?
        public var subscriptionGracePeriod: SubscriptionGracePeriod?
        public var subscriptionGroups: SubscriptionGroups?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appClips: AppClips? = nil,
                    appCustomProductPages: AppCustomProductPages? = nil,
                    appEvents: AppEvents? = nil,
                    appInfos: AppInfos? = nil,
                    appStoreVersions: AppStoreVersions? = nil,
                    availableTerritories: AvailableTerritories? = nil,
                    betaAppLocalizations: BetaAppLocalizations? = nil,
                    betaAppReviewDetail: BetaAppReviewDetail? = nil,
                    betaGroups: BetaGroups? = nil,
                    betaLicenseAgreement: BetaLicenseAgreement? = nil,
                    builds: Builds? = nil,
                    ciProduct: CiProduct? = nil,
                    endUserLicenseAgreement: EndUserLicenseAgreement? = nil,
                    gameCenterEnabledVersions: GameCenterEnabledVersions? = nil,
                    inAppPurchases: InAppPurchases? = nil,
                    inAppPurchasesV2: InAppPurchasesV2? = nil,
                    preOrder: PreOrder? = nil,
                    preReleaseVersions: PreReleaseVersions? = nil,
                    prices: Prices? = nil,
                    promotedPurchases: PromotedPurchases? = nil,
                    reviewSubmissions: ReviewSubmissions? = nil,
                    subscriptionGracePeriod: SubscriptionGracePeriod? = nil,
                    subscriptionGroups: SubscriptionGroups? = nil)
        {
            self.appClips = appClips
            self.appCustomProductPages = appCustomProductPages
            self.appEvents = appEvents
            self.appInfos = appInfos
            self.appStoreVersions = appStoreVersions
            self.availableTerritories = availableTerritories
            self.betaAppLocalizations = betaAppLocalizations
            self.betaAppReviewDetail = betaAppReviewDetail
            self.betaGroups = betaGroups
            self.betaLicenseAgreement = betaLicenseAgreement
            self.builds = builds
            self.ciProduct = ciProduct
            self.endUserLicenseAgreement = endUserLicenseAgreement
            self.gameCenterEnabledVersions = gameCenterEnabledVersions
            self.inAppPurchases = inAppPurchases
            self.inAppPurchasesV2 = inAppPurchasesV2
            self.preOrder = preOrder
            self.preReleaseVersions = preReleaseVersions
            self.prices = prices
            self.promotedPurchases = promotedPurchases
            self.reviewSubmissions = reviewSubmissions
            self.subscriptionGracePeriod = subscriptionGracePeriod
            self.subscriptionGroups = subscriptionGroups
        }

        public init(appClips: AppClips? = nil,
                    appCustomProductPages: AppCustomProductPages? = nil,
                    appEvents: AppEvents? = nil,
                    appInfos: AppInfos? = nil,
                    appStoreVersions: AppStoreVersions? = nil,
                    betaAppLocalizations: BetaAppLocalizations? = nil,
                    betaAppReviewDetail: BetaAppReviewDetail? = nil,
                    betaGroups: BetaGroups? = nil,
                    betaLicenseAgreement: BetaLicenseAgreement? = nil,
                    builds: Builds? = nil,
                    ciProduct: CiProduct? = nil,
                    endUserLicenseAgreement: EndUserLicenseAgreement? = nil,
                    gameCenterEnabledVersions: GameCenterEnabledVersions? = nil,
                    inAppPurchasesV2: InAppPurchasesV2? = nil,
                    preOrder: PreOrder? = nil,
                    preReleaseVersions: PreReleaseVersions? = nil,
                    promotedPurchases: PromotedPurchases? = nil,
                    reviewSubmissions: ReviewSubmissions? = nil,
                    subscriptionGracePeriod: SubscriptionGracePeriod? = nil,
                    subscriptionGroups: SubscriptionGroups? = nil)
        {
            self.appClips = appClips
            self.appCustomProductPages = appCustomProductPages
            self.appEvents = appEvents
            self.appInfos = appInfos
            self.appStoreVersions = appStoreVersions
            self.betaAppLocalizations = betaAppLocalizations
            self.betaAppReviewDetail = betaAppReviewDetail
            self.betaGroups = betaGroups
            self.betaLicenseAgreement = betaLicenseAgreement
            self.builds = builds
            self.ciProduct = ciProduct
            self.endUserLicenseAgreement = endUserLicenseAgreement
            self.gameCenterEnabledVersions = gameCenterEnabledVersions
            self.inAppPurchasesV2 = inAppPurchasesV2
            self.preOrder = preOrder
            self.preReleaseVersions = preReleaseVersions
            self.promotedPurchases = promotedPurchases
            self.reviewSubmissions = reviewSubmissions
            self.subscriptionGracePeriod = subscriptionGracePeriod
            self.subscriptionGroups = subscriptionGroups
        }

        public struct AppClips: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appClips" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct AppCustomProductPages: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appCustomProductPages" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct AppEvents: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appEvents" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct AppInfos: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appInfos" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct AppStoreVersions: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersions" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct AvailableTerritories: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "territories" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct BetaAppLocalizations: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "betaAppLocalizations" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct BetaAppReviewDetail: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "betaAppReviewDetails" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct BetaGroups: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "betaGroups" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct BetaLicenseAgreement: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "betaLicenseAgreements" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct Builds: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "builds" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct CiProduct: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "ciProducts" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct EndUserLicenseAgreement: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "endUserLicenseAgreements" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct GameCenterEnabledVersions: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "gameCenterEnabledVersions" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct InAppPurchases: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "inAppPurchases" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct InAppPurchasesV2: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "inAppPurchases" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct PreOrder: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appPreOrders" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct PreReleaseVersions: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "preReleaseVersions" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct Prices: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appPrices" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct PromotedPurchases: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "promotedPurchases" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct ReviewSubmissions: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "reviewSubmissions" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct SubscriptionGracePeriod: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "subscriptionGracePeriods" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        public struct SubscriptionGroups: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "subscriptionGroups" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
