import Bagbutik_Core
import Foundation

public struct AppsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = App

    public let data: [App]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [App],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([App].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getAppClips(for app: App) -> [AppClip] {
        guard let appClipIds = app.relationships?.appClips?.data?.map(\.id),
              let appClips = included?.compactMap({ relationship -> AppClip? in
                  guard case let .appClip(appClip) = relationship else { return nil }
                  return appClipIds.contains(appClip.id) ? appClip : nil
              })
        else {
            return []
        }
        return appClips
    }

    public func getAppCustomProductPages(for app: App) -> [AppCustomProductPage] {
        guard let appCustomProductPageIds = app.relationships?.appCustomProductPages?.data?.map(\.id),
              let appCustomProductPages = included?.compactMap({ relationship -> AppCustomProductPage? in
                  guard case let .appCustomProductPage(appCustomProductPage) = relationship else { return nil }
                  return appCustomProductPageIds.contains(appCustomProductPage.id) ? appCustomProductPage : nil
              })
        else {
            return []
        }
        return appCustomProductPages
    }

    public func getAppEncryptionDeclarations(for app: App) -> [AppEncryptionDeclaration] {
        guard let appEncryptionDeclarationIds = app.relationships?.appEncryptionDeclarations?.data?.map(\.id),
              let appEncryptionDeclarations = included?.compactMap({ relationship -> AppEncryptionDeclaration? in
                  guard case let .appEncryptionDeclaration(appEncryptionDeclaration) = relationship else { return nil }
                  return appEncryptionDeclarationIds.contains(appEncryptionDeclaration.id) ? appEncryptionDeclaration : nil
              })
        else {
            return []
        }
        return appEncryptionDeclarations
    }

    public func getAppEvents(for app: App) -> [AppEvent] {
        guard let appEventIds = app.relationships?.appEvents?.data?.map(\.id),
              let appEvents = included?.compactMap({ relationship -> AppEvent? in
                  guard case let .appEvent(appEvent) = relationship else { return nil }
                  return appEventIds.contains(appEvent.id) ? appEvent : nil
              })
        else {
            return []
        }
        return appEvents
    }

    public func getAppInfos(for app: App) -> [AppInfo] {
        guard let appInfoIds = app.relationships?.appInfos?.data?.map(\.id),
              let appInfos = included?.compactMap({ relationship -> AppInfo? in
                  guard case let .appInfo(appInfo) = relationship else { return nil }
                  return appInfoIds.contains(appInfo.id) ? appInfo : nil
              })
        else {
            return []
        }
        return appInfos
    }

    public func getAppStoreVersionExperimentsV2(for app: App) -> [AppStoreVersionExperimentV2] {
        guard let appStoreVersionExperimentsV2Ids = app.relationships?.appStoreVersionExperimentsV2?.data?.map(\.id),
              let appStoreVersionExperimentsV2 = included?.compactMap({ relationship -> AppStoreVersionExperimentV2? in
                  guard case let .appStoreVersionExperimentV2(appStoreVersionExperimentsV2) = relationship else { return nil }
                  return appStoreVersionExperimentsV2Ids.contains(appStoreVersionExperimentsV2.id) ? appStoreVersionExperimentsV2 : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentsV2
    }

    public func getAppStoreVersions(for app: App) -> [AppStoreVersion] {
        guard let appStoreVersionIds = app.relationships?.appStoreVersions?.data?.map(\.id),
              let appStoreVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
                  return appStoreVersionIds.contains(appStoreVersion.id) ? appStoreVersion : nil
              })
        else {
            return []
        }
        return appStoreVersions
    }

    public func getBetaAppLocalizations(for app: App) -> [BetaAppLocalization] {
        guard let betaAppLocalizationIds = app.relationships?.betaAppLocalizations?.data?.map(\.id),
              let betaAppLocalizations = included?.compactMap({ relationship -> BetaAppLocalization? in
                  guard case let .betaAppLocalization(betaAppLocalization) = relationship else { return nil }
                  return betaAppLocalizationIds.contains(betaAppLocalization.id) ? betaAppLocalization : nil
              })
        else {
            return []
        }
        return betaAppLocalizations
    }

    public func getBetaAppReviewDetail(for app: App) -> BetaAppReviewDetail? {
        included?.compactMap { relationship -> BetaAppReviewDetail? in
            guard case let .betaAppReviewDetail(betaAppReviewDetail) = relationship else { return nil }
            return betaAppReviewDetail
        }.first { $0.id == app.relationships?.betaAppReviewDetail?.data?.id }
    }

    public func getBetaGroups(for app: App) -> [BetaGroup] {
        guard let betaGroupIds = app.relationships?.betaGroups?.data?.map(\.id),
              let betaGroups = included?.compactMap({ relationship -> BetaGroup? in
                  guard case let .betaGroup(betaGroup) = relationship else { return nil }
                  return betaGroupIds.contains(betaGroup.id) ? betaGroup : nil
              })
        else {
            return []
        }
        return betaGroups
    }

    public func getBetaLicenseAgreement(for app: App) -> BetaLicenseAgreement? {
        included?.compactMap { relationship -> BetaLicenseAgreement? in
            guard case let .betaLicenseAgreement(betaLicenseAgreement) = relationship else { return nil }
            return betaLicenseAgreement
        }.first { $0.id == app.relationships?.betaLicenseAgreement?.data?.id }
    }

    public func getBuilds(for app: App) -> [Build] {
        guard let buildIds = app.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public func getCiProduct(for app: App) -> CiProduct? {
        included?.compactMap { relationship -> CiProduct? in
            guard case let .ciProduct(ciProduct) = relationship else { return nil }
            return ciProduct
        }.first { $0.id == app.relationships?.ciProduct?.data?.id }
    }

    public func getEndUserLicenseAgreement(for app: App) -> EndUserLicenseAgreement? {
        included?.compactMap { relationship -> EndUserLicenseAgreement? in
            guard case let .endUserLicenseAgreement(endUserLicenseAgreement) = relationship else { return nil }
            return endUserLicenseAgreement
        }.first { $0.id == app.relationships?.endUserLicenseAgreement?.data?.id }
    }

    public func getGameCenterDetail(for app: App) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == app.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterEnabledVersions(for app: App) -> [GameCenterEnabledVersion] {
        guard let gameCenterEnabledVersionIds = app.relationships?.gameCenterEnabledVersions?.data?.map(\.id),
              let gameCenterEnabledVersions = included?.compactMap({ relationship -> GameCenterEnabledVersion? in
                  guard case let .gameCenterEnabledVersion(gameCenterEnabledVersion) = relationship else { return nil }
                  return gameCenterEnabledVersionIds.contains(gameCenterEnabledVersion.id) ? gameCenterEnabledVersion : nil
              })
        else {
            return []
        }
        return gameCenterEnabledVersions
    }

    public func getInAppPurchasesV2(for app: App) -> [InAppPurchase] {
        guard let inAppPurchasesV2Ids = app.relationships?.inAppPurchasesV2?.data?.map(\.id),
              let inAppPurchasesV2 = included?.compactMap({ relationship -> InAppPurchase? in
                  guard case let .inAppPurchase(inAppPurchasesV2) = relationship else { return nil }
                  return inAppPurchasesV2Ids.contains(inAppPurchasesV2.id) ? inAppPurchasesV2 : nil
              })
        else {
            return []
        }
        return inAppPurchasesV2
    }

    public func getPreOrder(for app: App) -> AppPreOrder? {
        included?.compactMap { relationship -> AppPreOrder? in
            guard case let .appPreOrder(preOrder) = relationship else { return nil }
            return preOrder
        }.first { $0.id == app.relationships?.preOrder?.data?.id }
    }

    public func getPreReleaseVersions(for app: App) -> [PrereleaseVersion] {
        guard let preReleaseVersionIds = app.relationships?.preReleaseVersions?.data?.map(\.id),
              let preReleaseVersions = included?.compactMap({ relationship -> PrereleaseVersion? in
                  guard case let .prereleaseVersion(preReleaseVersion) = relationship else { return nil }
                  return preReleaseVersionIds.contains(preReleaseVersion.id) ? preReleaseVersion : nil
              })
        else {
            return []
        }
        return preReleaseVersions
    }

    public func getPromotedPurchases(for app: App) -> [PromotedPurchase] {
        guard let promotedPurchaseIds = app.relationships?.promotedPurchases?.data?.map(\.id),
              let promotedPurchases = included?.compactMap({ relationship -> PromotedPurchase? in
                  guard case let .promotedPurchase(promotedPurchase) = relationship else { return nil }
                  return promotedPurchaseIds.contains(promotedPurchase.id) ? promotedPurchase : nil
              })
        else {
            return []
        }
        return promotedPurchases
    }

    public func getReviewSubmissions(for app: App) -> [ReviewSubmission] {
        guard let reviewSubmissionIds = app.relationships?.reviewSubmissions?.data?.map(\.id),
              let reviewSubmissions = included?.compactMap({ relationship -> ReviewSubmission? in
                  guard case let .reviewSubmission(reviewSubmission) = relationship else { return nil }
                  return reviewSubmissionIds.contains(reviewSubmission.id) ? reviewSubmission : nil
              })
        else {
            return []
        }
        return reviewSubmissions
    }

    public func getSubscriptionGracePeriod(for app: App) -> SubscriptionGracePeriod? {
        included?.compactMap { relationship -> SubscriptionGracePeriod? in
            guard case let .subscriptionGracePeriod(subscriptionGracePeriod) = relationship else { return nil }
            return subscriptionGracePeriod
        }.first { $0.id == app.relationships?.subscriptionGracePeriod?.data?.id }
    }

    public func getSubscriptionGroups(for app: App) -> [SubscriptionGroup] {
        guard let subscriptionGroupIds = app.relationships?.subscriptionGroups?.data?.map(\.id),
              let subscriptionGroups = included?.compactMap({ relationship -> SubscriptionGroup? in
                  guard case let .subscriptionGroup(subscriptionGroup) = relationship else { return nil }
                  return subscriptionGroupIds.contains(subscriptionGroup.id) ? subscriptionGroup : nil
              })
        else {
            return []
        }
        return subscriptionGroups
    }

    public enum Included: Codable, Sendable {
        case appClip(AppClip)
        case appCustomProductPage(AppCustomProductPage)
        case appEncryptionDeclaration(AppEncryptionDeclaration)
        case appEvent(AppEvent)
        case appInfo(AppInfo)
        case appPreOrder(AppPreOrder)
        case appStoreVersion(AppStoreVersion)
        case appStoreVersionExperimentV2(AppStoreVersionExperimentV2)
        case betaAppLocalization(BetaAppLocalization)
        case betaAppReviewDetail(BetaAppReviewDetail)
        case betaGroup(BetaGroup)
        case betaLicenseAgreement(BetaLicenseAgreement)
        case build(Build)
        case ciProduct(CiProduct)
        case endUserLicenseAgreement(EndUserLicenseAgreement)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterEnabledVersion(GameCenterEnabledVersion)
        case inAppPurchase(InAppPurchase)
        case inAppPurchaseV2(InAppPurchaseV2)
        case prereleaseVersion(PrereleaseVersion)
        case promotedPurchase(PromotedPurchase)
        case reviewSubmission(ReviewSubmission)
        case subscriptionGracePeriod(SubscriptionGracePeriod)
        case subscriptionGroup(SubscriptionGroup)

        public init(from decoder: Decoder) throws {
            if let appClip = try? AppClip(from: decoder) {
                self = .appClip(appClip)
            } else if let appCustomProductPage = try? AppCustomProductPage(from: decoder) {
                self = .appCustomProductPage(appCustomProductPage)
            } else if let appEncryptionDeclaration = try? AppEncryptionDeclaration(from: decoder) {
                self = .appEncryptionDeclaration(appEncryptionDeclaration)
            } else if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appInfo = try? AppInfo(from: decoder) {
                self = .appInfo(appInfo)
            } else if let appPreOrder = try? AppPreOrder(from: decoder) {
                self = .appPreOrder(appPreOrder)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let appStoreVersionExperimentV2 = try? AppStoreVersionExperimentV2(from: decoder) {
                self = .appStoreVersionExperimentV2(appStoreVersionExperimentV2)
            } else if let betaAppLocalization = try? BetaAppLocalization(from: decoder) {
                self = .betaAppLocalization(betaAppLocalization)
            } else if let betaAppReviewDetail = try? BetaAppReviewDetail(from: decoder) {
                self = .betaAppReviewDetail(betaAppReviewDetail)
            } else if let betaGroup = try? BetaGroup(from: decoder) {
                self = .betaGroup(betaGroup)
            } else if let betaLicenseAgreement = try? BetaLicenseAgreement(from: decoder) {
                self = .betaLicenseAgreement(betaLicenseAgreement)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
            } else if let ciProduct = try? CiProduct(from: decoder) {
                self = .ciProduct(ciProduct)
            } else if let endUserLicenseAgreement = try? EndUserLicenseAgreement(from: decoder) {
                self = .endUserLicenseAgreement(endUserLicenseAgreement)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterEnabledVersion = try? GameCenterEnabledVersion(from: decoder) {
                self = .gameCenterEnabledVersion(gameCenterEnabledVersion)
            } else if let inAppPurchase = try? InAppPurchase(from: decoder) {
                self = .inAppPurchase(inAppPurchase)
            } else if let inAppPurchaseV2 = try? InAppPurchaseV2(from: decoder) {
                self = .inAppPurchaseV2(inAppPurchaseV2)
            } else if let prereleaseVersion = try? PrereleaseVersion(from: decoder) {
                self = .prereleaseVersion(prereleaseVersion)
            } else if let promotedPurchase = try? PromotedPurchase(from: decoder) {
                self = .promotedPurchase(promotedPurchase)
            } else if let reviewSubmission = try? ReviewSubmission(from: decoder) {
                self = .reviewSubmission(reviewSubmission)
            } else if let subscriptionGracePeriod = try? SubscriptionGracePeriod(from: decoder) {
                self = .subscriptionGracePeriod(subscriptionGracePeriod)
            } else if let subscriptionGroup = try? SubscriptionGroup(from: decoder) {
                self = .subscriptionGroup(subscriptionGroup)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appClip(value):
                try value.encode(to: encoder)
            case let .appCustomProductPage(value):
                try value.encode(to: encoder)
            case let .appEncryptionDeclaration(value):
                try value.encode(to: encoder)
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .appInfo(value):
                try value.encode(to: encoder)
            case let .appPreOrder(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentV2(value):
                try value.encode(to: encoder)
            case let .betaAppLocalization(value):
                try value.encode(to: encoder)
            case let .betaAppReviewDetail(value):
                try value.encode(to: encoder)
            case let .betaGroup(value):
                try value.encode(to: encoder)
            case let .betaLicenseAgreement(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            case let .ciProduct(value):
                try value.encode(to: encoder)
            case let .endUserLicenseAgreement(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterEnabledVersion(value):
                try value.encode(to: encoder)
            case let .inAppPurchase(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseV2(value):
                try value.encode(to: encoder)
            case let .prereleaseVersion(value):
                try value.encode(to: encoder)
            case let .promotedPurchase(value):
                try value.encode(to: encoder)
            case let .reviewSubmission(value):
                try value.encode(to: encoder)
            case let .subscriptionGracePeriod(value):
                try value.encode(to: encoder)
            case let .subscriptionGroup(value):
                try value.encode(to: encoder)
            }
        }
    }
}
