import Bagbutik_Core
import Foundation

/**
 # App
 The data structure that represents an Apps resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/app>
 */
public struct App: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "apps" }
    /// The resource’s attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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
        public var accessibilityUrl: String?
        public var bundleId: String?
        public var contentRightsDeclaration: ContentRightsDeclaration?
        public var isOrEverWasMadeForKids: Bool?
        public var name: String?
        public var primaryLocale: String?
        public var sku: String?
        public var streamlinedPurchasingEnabled: Bool?
        public var subscriptionStatusUrl: String?
        public var subscriptionStatusUrlForSandbox: String?
        public var subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion?
        public var subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion?

        public init(accessibilityUrl: String? = nil,
                    bundleId: String? = nil,
                    contentRightsDeclaration: ContentRightsDeclaration? = nil,
                    isOrEverWasMadeForKids: Bool? = nil,
                    name: String? = nil,
                    primaryLocale: String? = nil,
                    sku: String? = nil,
                    streamlinedPurchasingEnabled: Bool? = nil,
                    subscriptionStatusUrl: String? = nil,
                    subscriptionStatusUrlForSandbox: String? = nil,
                    subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                    subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
        {
            self.accessibilityUrl = accessibilityUrl
            self.bundleId = bundleId
            self.contentRightsDeclaration = contentRightsDeclaration
            self.isOrEverWasMadeForKids = isOrEverWasMadeForKids
            self.name = name
            self.primaryLocale = primaryLocale
            self.sku = sku
            self.streamlinedPurchasingEnabled = streamlinedPurchasingEnabled
            self.subscriptionStatusUrl = subscriptionStatusUrl
            self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
            self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
            self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            accessibilityUrl = try container.decodeIfPresent(String.self, forKey: "accessibilityUrl")
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            contentRightsDeclaration = try container.decodeIfPresent(ContentRightsDeclaration.self, forKey: "contentRightsDeclaration")
            isOrEverWasMadeForKids = try container.decodeIfPresent(Bool.self, forKey: "isOrEverWasMadeForKids")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            primaryLocale = try container.decodeIfPresent(String.self, forKey: "primaryLocale")
            sku = try container.decodeIfPresent(String.self, forKey: "sku")
            streamlinedPurchasingEnabled = try container.decodeIfPresent(Bool.self, forKey: "streamlinedPurchasingEnabled")
            subscriptionStatusUrl = try container.decodeIfPresent(String.self, forKey: "subscriptionStatusUrl")
            subscriptionStatusUrlForSandbox = try container.decodeIfPresent(String.self, forKey: "subscriptionStatusUrlForSandbox")
            subscriptionStatusUrlVersion = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: "subscriptionStatusUrlVersion")
            subscriptionStatusUrlVersionForSandbox = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: "subscriptionStatusUrlVersionForSandbox")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(accessibilityUrl, forKey: "accessibilityUrl")
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(contentRightsDeclaration, forKey: "contentRightsDeclaration")
            try container.encodeIfPresent(isOrEverWasMadeForKids, forKey: "isOrEverWasMadeForKids")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(primaryLocale, forKey: "primaryLocale")
            try container.encodeIfPresent(sku, forKey: "sku")
            try container.encodeIfPresent(streamlinedPurchasingEnabled, forKey: "streamlinedPurchasingEnabled")
            try container.encodeIfPresent(subscriptionStatusUrl, forKey: "subscriptionStatusUrl")
            try container.encodeIfPresent(subscriptionStatusUrlForSandbox, forKey: "subscriptionStatusUrlForSandbox")
            try container.encodeIfPresent(subscriptionStatusUrlVersion, forKey: "subscriptionStatusUrlVersion")
            try container.encodeIfPresent(subscriptionStatusUrlVersionForSandbox, forKey: "subscriptionStatusUrlVersionForSandbox")
        }

        public enum ContentRightsDeclaration: String, Sendable, Codable, CaseIterable {
            case doesNotUseThirdPartyContent = "DOES_NOT_USE_THIRD_PARTY_CONTENT"
            case usesThirdPartyContent = "USES_THIRD_PARTY_CONTENT"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var accessibilityDeclarations: AccessibilityDeclarations?
        public var alternativeDistributionKey: AlternativeDistributionKey?
        public var analyticsReportRequests: AnalyticsReportRequests?
        public var appAvailabilityV2: AppAvailabilityV2?
        public var appClips: AppClips?
        public var appCustomProductPages: AppCustomProductPages?
        public var appEncryptionDeclarations: AppEncryptionDeclarations?
        public var appEvents: AppEvents?
        public var appInfos: AppInfos?
        public var appPricePoints: AppPricePoints?
        public var appPriceSchedule: AppPriceSchedule?
        public var appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2?
        public var appStoreVersions: AppStoreVersions?
        public var backgroundAssets: BackgroundAssets?
        public var betaAppLocalizations: BetaAppLocalizations?
        public var betaAppReviewDetail: BetaAppReviewDetail?
        public var betaFeedbackCrashSubmissions: BetaFeedbackCrashSubmissions?
        public var betaFeedbackScreenshotSubmissions: BetaFeedbackScreenshotSubmissions?
        public var betaGroups: BetaGroups?
        public var betaLicenseAgreement: BetaLicenseAgreement?
        public var betaTesters: BetaTesters?
        public var builds: Builds?
        public var ciProduct: CiProduct?
        public var customerReviewSummarizations: CustomerReviewSummarizations?
        public var customerReviews: CustomerReviews?
        public var endUserLicenseAgreement: EndUserLicenseAgreement?
        public var gameCenterDetail: GameCenterDetail?
        public var gameCenterEnabledVersions: GameCenterEnabledVersions?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var inAppPurchases: InAppPurchases? = nil
        public var inAppPurchasesV2: InAppPurchasesV2?
        public var marketplaceSearchDetail: MarketplaceSearchDetail?
        public var perfPowerMetrics: PerfPowerMetrics?
        public var preReleaseVersions: PreReleaseVersions?
        public var promotedPurchases: PromotedPurchases?
        public var reviewSubmissions: ReviewSubmissions?
        public var subscriptionGracePeriod: SubscriptionGracePeriod?
        public var subscriptionGroups: SubscriptionGroups?
        public var webhooks: Webhooks?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(accessibilityDeclarations: AccessibilityDeclarations? = nil,
                    alternativeDistributionKey: AlternativeDistributionKey? = nil,
                    analyticsReportRequests: AnalyticsReportRequests? = nil,
                    appAvailabilityV2: AppAvailabilityV2? = nil,
                    appClips: AppClips? = nil,
                    appCustomProductPages: AppCustomProductPages? = nil,
                    appEncryptionDeclarations: AppEncryptionDeclarations? = nil,
                    appEvents: AppEvents? = nil,
                    appInfos: AppInfos? = nil,
                    appPricePoints: AppPricePoints? = nil,
                    appPriceSchedule: AppPriceSchedule? = nil,
                    appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2? = nil,
                    appStoreVersions: AppStoreVersions? = nil,
                    backgroundAssets: BackgroundAssets? = nil,
                    betaAppLocalizations: BetaAppLocalizations? = nil,
                    betaAppReviewDetail: BetaAppReviewDetail? = nil,
                    betaFeedbackCrashSubmissions: BetaFeedbackCrashSubmissions? = nil,
                    betaFeedbackScreenshotSubmissions: BetaFeedbackScreenshotSubmissions? = nil,
                    betaGroups: BetaGroups? = nil,
                    betaLicenseAgreement: BetaLicenseAgreement? = nil,
                    betaTesters: BetaTesters? = nil,
                    builds: Builds? = nil,
                    ciProduct: CiProduct? = nil,
                    customerReviewSummarizations: CustomerReviewSummarizations? = nil,
                    customerReviews: CustomerReviews? = nil,
                    endUserLicenseAgreement: EndUserLicenseAgreement? = nil,
                    gameCenterDetail: GameCenterDetail? = nil,
                    gameCenterEnabledVersions: GameCenterEnabledVersions? = nil,
                    inAppPurchases: InAppPurchases? = nil,
                    inAppPurchasesV2: InAppPurchasesV2? = nil,
                    marketplaceSearchDetail: MarketplaceSearchDetail? = nil,
                    perfPowerMetrics: PerfPowerMetrics? = nil,
                    preReleaseVersions: PreReleaseVersions? = nil,
                    promotedPurchases: PromotedPurchases? = nil,
                    reviewSubmissions: ReviewSubmissions? = nil,
                    subscriptionGracePeriod: SubscriptionGracePeriod? = nil,
                    subscriptionGroups: SubscriptionGroups? = nil,
                    webhooks: Webhooks? = nil)
        {
            self.accessibilityDeclarations = accessibilityDeclarations
            self.alternativeDistributionKey = alternativeDistributionKey
            self.analyticsReportRequests = analyticsReportRequests
            self.appAvailabilityV2 = appAvailabilityV2
            self.appClips = appClips
            self.appCustomProductPages = appCustomProductPages
            self.appEncryptionDeclarations = appEncryptionDeclarations
            self.appEvents = appEvents
            self.appInfos = appInfos
            self.appPricePoints = appPricePoints
            self.appPriceSchedule = appPriceSchedule
            self.appStoreVersionExperimentsV2 = appStoreVersionExperimentsV2
            self.appStoreVersions = appStoreVersions
            self.backgroundAssets = backgroundAssets
            self.betaAppLocalizations = betaAppLocalizations
            self.betaAppReviewDetail = betaAppReviewDetail
            self.betaFeedbackCrashSubmissions = betaFeedbackCrashSubmissions
            self.betaFeedbackScreenshotSubmissions = betaFeedbackScreenshotSubmissions
            self.betaGroups = betaGroups
            self.betaLicenseAgreement = betaLicenseAgreement
            self.betaTesters = betaTesters
            self.builds = builds
            self.ciProduct = ciProduct
            self.customerReviewSummarizations = customerReviewSummarizations
            self.customerReviews = customerReviews
            self.endUserLicenseAgreement = endUserLicenseAgreement
            self.gameCenterDetail = gameCenterDetail
            self.gameCenterEnabledVersions = gameCenterEnabledVersions
            self.inAppPurchases = inAppPurchases
            self.inAppPurchasesV2 = inAppPurchasesV2
            self.marketplaceSearchDetail = marketplaceSearchDetail
            self.perfPowerMetrics = perfPowerMetrics
            self.preReleaseVersions = preReleaseVersions
            self.promotedPurchases = promotedPurchases
            self.reviewSubmissions = reviewSubmissions
            self.subscriptionGracePeriod = subscriptionGracePeriod
            self.subscriptionGroups = subscriptionGroups
            self.webhooks = webhooks
        }

        public init(accessibilityDeclarations: AccessibilityDeclarations? = nil,
                    alternativeDistributionKey: AlternativeDistributionKey? = nil,
                    analyticsReportRequests: AnalyticsReportRequests? = nil,
                    appAvailabilityV2: AppAvailabilityV2? = nil,
                    appClips: AppClips? = nil,
                    appCustomProductPages: AppCustomProductPages? = nil,
                    appEncryptionDeclarations: AppEncryptionDeclarations? = nil,
                    appEvents: AppEvents? = nil,
                    appInfos: AppInfos? = nil,
                    appPricePoints: AppPricePoints? = nil,
                    appPriceSchedule: AppPriceSchedule? = nil,
                    appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2? = nil,
                    appStoreVersions: AppStoreVersions? = nil,
                    backgroundAssets: BackgroundAssets? = nil,
                    betaAppLocalizations: BetaAppLocalizations? = nil,
                    betaAppReviewDetail: BetaAppReviewDetail? = nil,
                    betaFeedbackCrashSubmissions: BetaFeedbackCrashSubmissions? = nil,
                    betaFeedbackScreenshotSubmissions: BetaFeedbackScreenshotSubmissions? = nil,
                    betaGroups: BetaGroups? = nil,
                    betaLicenseAgreement: BetaLicenseAgreement? = nil,
                    betaTesters: BetaTesters? = nil,
                    builds: Builds? = nil,
                    ciProduct: CiProduct? = nil,
                    customerReviewSummarizations: CustomerReviewSummarizations? = nil,
                    customerReviews: CustomerReviews? = nil,
                    endUserLicenseAgreement: EndUserLicenseAgreement? = nil,
                    gameCenterDetail: GameCenterDetail? = nil,
                    gameCenterEnabledVersions: GameCenterEnabledVersions? = nil,
                    inAppPurchasesV2: InAppPurchasesV2? = nil,
                    marketplaceSearchDetail: MarketplaceSearchDetail? = nil,
                    perfPowerMetrics: PerfPowerMetrics? = nil,
                    preReleaseVersions: PreReleaseVersions? = nil,
                    promotedPurchases: PromotedPurchases? = nil,
                    reviewSubmissions: ReviewSubmissions? = nil,
                    subscriptionGracePeriod: SubscriptionGracePeriod? = nil,
                    subscriptionGroups: SubscriptionGroups? = nil,
                    webhooks: Webhooks? = nil)
        {
            self.accessibilityDeclarations = accessibilityDeclarations
            self.alternativeDistributionKey = alternativeDistributionKey
            self.analyticsReportRequests = analyticsReportRequests
            self.appAvailabilityV2 = appAvailabilityV2
            self.appClips = appClips
            self.appCustomProductPages = appCustomProductPages
            self.appEncryptionDeclarations = appEncryptionDeclarations
            self.appEvents = appEvents
            self.appInfos = appInfos
            self.appPricePoints = appPricePoints
            self.appPriceSchedule = appPriceSchedule
            self.appStoreVersionExperimentsV2 = appStoreVersionExperimentsV2
            self.appStoreVersions = appStoreVersions
            self.backgroundAssets = backgroundAssets
            self.betaAppLocalizations = betaAppLocalizations
            self.betaAppReviewDetail = betaAppReviewDetail
            self.betaFeedbackCrashSubmissions = betaFeedbackCrashSubmissions
            self.betaFeedbackScreenshotSubmissions = betaFeedbackScreenshotSubmissions
            self.betaGroups = betaGroups
            self.betaLicenseAgreement = betaLicenseAgreement
            self.betaTesters = betaTesters
            self.builds = builds
            self.ciProduct = ciProduct
            self.customerReviewSummarizations = customerReviewSummarizations
            self.customerReviews = customerReviews
            self.endUserLicenseAgreement = endUserLicenseAgreement
            self.gameCenterDetail = gameCenterDetail
            self.gameCenterEnabledVersions = gameCenterEnabledVersions
            self.inAppPurchasesV2 = inAppPurchasesV2
            self.marketplaceSearchDetail = marketplaceSearchDetail
            self.perfPowerMetrics = perfPowerMetrics
            self.preReleaseVersions = preReleaseVersions
            self.promotedPurchases = promotedPurchases
            self.reviewSubmissions = reviewSubmissions
            self.subscriptionGracePeriod = subscriptionGracePeriod
            self.subscriptionGroups = subscriptionGroups
            self.webhooks = webhooks
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            accessibilityDeclarations = try container.decodeIfPresent(AccessibilityDeclarations.self, forKey: "accessibilityDeclarations")
            alternativeDistributionKey = try container.decodeIfPresent(AlternativeDistributionKey.self, forKey: "alternativeDistributionKey")
            analyticsReportRequests = try container.decodeIfPresent(AnalyticsReportRequests.self, forKey: "analyticsReportRequests")
            appAvailabilityV2 = try container.decodeIfPresent(AppAvailabilityV2.self, forKey: "appAvailabilityV2")
            appClips = try container.decodeIfPresent(AppClips.self, forKey: "appClips")
            appCustomProductPages = try container.decodeIfPresent(AppCustomProductPages.self, forKey: "appCustomProductPages")
            appEncryptionDeclarations = try container.decodeIfPresent(AppEncryptionDeclarations.self, forKey: "appEncryptionDeclarations")
            appEvents = try container.decodeIfPresent(AppEvents.self, forKey: "appEvents")
            appInfos = try container.decodeIfPresent(AppInfos.self, forKey: "appInfos")
            appPricePoints = try container.decodeIfPresent(AppPricePoints.self, forKey: "appPricePoints")
            appPriceSchedule = try container.decodeIfPresent(AppPriceSchedule.self, forKey: "appPriceSchedule")
            appStoreVersionExperimentsV2 = try container.decodeIfPresent(AppStoreVersionExperimentsV2.self, forKey: "appStoreVersionExperimentsV2")
            appStoreVersions = try container.decodeIfPresent(AppStoreVersions.self, forKey: "appStoreVersions")
            backgroundAssets = try container.decodeIfPresent(BackgroundAssets.self, forKey: "backgroundAssets")
            betaAppLocalizations = try container.decodeIfPresent(BetaAppLocalizations.self, forKey: "betaAppLocalizations")
            betaAppReviewDetail = try container.decodeIfPresent(BetaAppReviewDetail.self, forKey: "betaAppReviewDetail")
            betaFeedbackCrashSubmissions = try container.decodeIfPresent(BetaFeedbackCrashSubmissions.self, forKey: "betaFeedbackCrashSubmissions")
            betaFeedbackScreenshotSubmissions = try container.decodeIfPresent(BetaFeedbackScreenshotSubmissions.self, forKey: "betaFeedbackScreenshotSubmissions")
            betaGroups = try container.decodeIfPresent(BetaGroups.self, forKey: "betaGroups")
            betaLicenseAgreement = try container.decodeIfPresent(BetaLicenseAgreement.self, forKey: "betaLicenseAgreement")
            betaTesters = try container.decodeIfPresent(BetaTesters.self, forKey: "betaTesters")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
            ciProduct = try container.decodeIfPresent(CiProduct.self, forKey: "ciProduct")
            customerReviewSummarizations = try container.decodeIfPresent(CustomerReviewSummarizations.self, forKey: "customerReviewSummarizations")
            customerReviews = try container.decodeIfPresent(CustomerReviews.self, forKey: "customerReviews")
            endUserLicenseAgreement = try container.decodeIfPresent(EndUserLicenseAgreement.self, forKey: "endUserLicenseAgreement")
            gameCenterDetail = try container.decodeIfPresent(GameCenterDetail.self, forKey: "gameCenterDetail")
            gameCenterEnabledVersions = try container.decodeIfPresent(GameCenterEnabledVersions.self, forKey: "gameCenterEnabledVersions")
            inAppPurchases = try container.decodeIfPresent(InAppPurchases.self, forKey: "inAppPurchases")
            inAppPurchasesV2 = try container.decodeIfPresent(InAppPurchasesV2.self, forKey: "inAppPurchasesV2")
            marketplaceSearchDetail = try container.decodeIfPresent(MarketplaceSearchDetail.self, forKey: "marketplaceSearchDetail")
            perfPowerMetrics = try container.decodeIfPresent(PerfPowerMetrics.self, forKey: "perfPowerMetrics")
            preReleaseVersions = try container.decodeIfPresent(PreReleaseVersions.self, forKey: "preReleaseVersions")
            promotedPurchases = try container.decodeIfPresent(PromotedPurchases.self, forKey: "promotedPurchases")
            reviewSubmissions = try container.decodeIfPresent(ReviewSubmissions.self, forKey: "reviewSubmissions")
            subscriptionGracePeriod = try container.decodeIfPresent(SubscriptionGracePeriod.self, forKey: "subscriptionGracePeriod")
            subscriptionGroups = try container.decodeIfPresent(SubscriptionGroups.self, forKey: "subscriptionGroups")
            webhooks = try container.decodeIfPresent(Webhooks.self, forKey: "webhooks")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(accessibilityDeclarations, forKey: "accessibilityDeclarations")
            try container.encodeIfPresent(alternativeDistributionKey, forKey: "alternativeDistributionKey")
            try container.encodeIfPresent(analyticsReportRequests, forKey: "analyticsReportRequests")
            try container.encodeIfPresent(appAvailabilityV2, forKey: "appAvailabilityV2")
            try container.encodeIfPresent(appClips, forKey: "appClips")
            try container.encodeIfPresent(appCustomProductPages, forKey: "appCustomProductPages")
            try container.encodeIfPresent(appEncryptionDeclarations, forKey: "appEncryptionDeclarations")
            try container.encodeIfPresent(appEvents, forKey: "appEvents")
            try container.encodeIfPresent(appInfos, forKey: "appInfos")
            try container.encodeIfPresent(appPricePoints, forKey: "appPricePoints")
            try container.encodeIfPresent(appPriceSchedule, forKey: "appPriceSchedule")
            try container.encodeIfPresent(appStoreVersionExperimentsV2, forKey: "appStoreVersionExperimentsV2")
            try container.encodeIfPresent(appStoreVersions, forKey: "appStoreVersions")
            try container.encodeIfPresent(backgroundAssets, forKey: "backgroundAssets")
            try container.encodeIfPresent(betaAppLocalizations, forKey: "betaAppLocalizations")
            try container.encodeIfPresent(betaAppReviewDetail, forKey: "betaAppReviewDetail")
            try container.encodeIfPresent(betaFeedbackCrashSubmissions, forKey: "betaFeedbackCrashSubmissions")
            try container.encodeIfPresent(betaFeedbackScreenshotSubmissions, forKey: "betaFeedbackScreenshotSubmissions")
            try container.encodeIfPresent(betaGroups, forKey: "betaGroups")
            try container.encodeIfPresent(betaLicenseAgreement, forKey: "betaLicenseAgreement")
            try container.encodeIfPresent(betaTesters, forKey: "betaTesters")
            try container.encodeIfPresent(builds, forKey: "builds")
            try container.encodeIfPresent(ciProduct, forKey: "ciProduct")
            try container.encodeIfPresent(customerReviewSummarizations, forKey: "customerReviewSummarizations")
            try container.encodeIfPresent(customerReviews, forKey: "customerReviews")
            try container.encodeIfPresent(endUserLicenseAgreement, forKey: "endUserLicenseAgreement")
            try container.encodeIfPresent(gameCenterDetail, forKey: "gameCenterDetail")
            try container.encodeIfPresent(gameCenterEnabledVersions, forKey: "gameCenterEnabledVersions")
            try container.encodeIfPresent(inAppPurchases, forKey: "inAppPurchases")
            try container.encodeIfPresent(inAppPurchasesV2, forKey: "inAppPurchasesV2")
            try container.encodeIfPresent(marketplaceSearchDetail, forKey: "marketplaceSearchDetail")
            try container.encodeIfPresent(perfPowerMetrics, forKey: "perfPowerMetrics")
            try container.encodeIfPresent(preReleaseVersions, forKey: "preReleaseVersions")
            try container.encodeIfPresent(promotedPurchases, forKey: "promotedPurchases")
            try container.encodeIfPresent(reviewSubmissions, forKey: "reviewSubmissions")
            try container.encodeIfPresent(subscriptionGracePeriod, forKey: "subscriptionGracePeriod")
            try container.encodeIfPresent(subscriptionGroups, forKey: "subscriptionGroups")
            try container.encodeIfPresent(webhooks, forKey: "webhooks")
        }

        public struct AccessibilityDeclarations: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AlternativeDistributionKey: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AnalyticsReportRequests: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AppAvailabilityV2: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AppClips: Codable, Sendable {
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
                public var type: String { "appClips" }

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

        public struct AppCustomProductPages: Codable, Sendable {
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
                public var type: String { "appCustomProductPages" }

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

        public struct AppEncryptionDeclarations: Codable, Sendable {
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
                public var type: String { "appEncryptionDeclarations" }

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

        public struct AppEvents: Codable, Sendable {
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
                public var type: String { "appEvents" }

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

        public struct AppInfos: Codable, Sendable {
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
                public var type: String { "appInfos" }

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

        public struct AppPricePoints: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AppPriceSchedule: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct AppStoreVersionExperimentsV2: Codable, Sendable {
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
                public var type: String { "appStoreVersionExperiments" }

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

        public struct AppStoreVersions: Codable, Sendable {
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
                public var type: String { "appStoreVersions" }

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

        public struct BackgroundAssets: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct BetaAppLocalizations: Codable, Sendable {
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
                public var type: String { "betaAppLocalizations" }

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

        public struct BetaAppReviewDetail: Codable, Sendable {
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
                public var type: String { "betaAppReviewDetails" }

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

        public struct BetaFeedbackCrashSubmissions: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct BetaFeedbackScreenshotSubmissions: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct BetaGroups: Codable, Sendable {
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
                public var type: String { "betaGroups" }

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

        public struct BetaLicenseAgreement: Codable, Sendable {
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
                public var type: String { "betaLicenseAgreements" }

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

        public struct BetaTesters: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct Builds: Codable, Sendable {
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

        public struct CiProduct: Codable, Sendable {
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
                public var type: String { "ciProducts" }

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

        public struct CustomerReviewSummarizations: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct CustomerReviews: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct EndUserLicenseAgreement: Codable, Sendable {
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
                public var type: String { "endUserLicenseAgreements" }

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

        public struct GameCenterDetail: Codable, Sendable {
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
                public var type: String { "gameCenterDetails" }

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

        public struct GameCenterEnabledVersions: Codable, Sendable {
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
                public var type: String { "gameCenterEnabledVersions" }

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

        public struct InAppPurchases: Codable, Sendable {
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
                public var type: String { "inAppPurchases" }

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

        public struct InAppPurchasesV2: Codable, Sendable {
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
                public var type: String { "inAppPurchases" }

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

        public struct MarketplaceSearchDetail: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct PerfPowerMetrics: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct PreReleaseVersions: Codable, Sendable {
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
                public var type: String { "preReleaseVersions" }

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

        public struct PromotedPurchases: Codable, Sendable {
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
                public var type: String { "promotedPurchases" }

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

        public struct ReviewSubmissions: Codable, Sendable {
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
                public var type: String { "reviewSubmissions" }

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

        public struct SubscriptionGracePeriod: Codable, Sendable {
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
                public var type: String { "subscriptionGracePeriods" }

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

        public struct SubscriptionGroups: Codable, Sendable {
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
                public var type: String { "subscriptionGroups" }

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

        public struct Webhooks: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }
    }
}
