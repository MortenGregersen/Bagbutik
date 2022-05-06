import Foundation

/**
 A response that contains a single Apps resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appresponse>
 */
public struct AppResponse: Codable {
    /// The resource data.
    public let data: App
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: App, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAppClips() -> [AppClip] {
        guard let appClipIds = data.relationships?.appClips?.data?.map(\.id),
              let appClips = included?.compactMap({ relationship -> AppClip? in
                  guard case let .appClip(appClip) = relationship else { return nil }
                  return appClipIds.contains(appClip.id) ? appClip : nil
              })
        else {
            return []
        }
        return appClips
    }

    public func getAppCustomProductPages() -> [AppCustomProductPage] {
        guard let appCustomProductPageIds = data.relationships?.appCustomProductPages?.data?.map(\.id),
              let appCustomProductPages = included?.compactMap({ relationship -> AppCustomProductPage? in
                  guard case let .appCustomProductPage(appCustomProductPage) = relationship else { return nil }
                  return appCustomProductPageIds.contains(appCustomProductPage.id) ? appCustomProductPage : nil
              })
        else {
            return []
        }
        return appCustomProductPages
    }

    public func getAppEvents() -> [AppEvent] {
        guard let appEventIds = data.relationships?.appEvents?.data?.map(\.id),
              let appEvents = included?.compactMap({ relationship -> AppEvent? in
                  guard case let .appEvent(appEvent) = relationship else { return nil }
                  return appEventIds.contains(appEvent.id) ? appEvent : nil
              })
        else {
            return []
        }
        return appEvents
    }

    public func getAppInfos() -> [AppInfo] {
        guard let appInfoIds = data.relationships?.appInfos?.data?.map(\.id),
              let appInfos = included?.compactMap({ relationship -> AppInfo? in
                  guard case let .appInfo(appInfo) = relationship else { return nil }
                  return appInfoIds.contains(appInfo.id) ? appInfo : nil
              })
        else {
            return []
        }
        return appInfos
    }

    public func getAppStoreVersions() -> [AppStoreVersion] {
        guard let appStoreVersionIds = data.relationships?.appStoreVersions?.data?.map(\.id),
              let appStoreVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
                  return appStoreVersionIds.contains(appStoreVersion.id) ? appStoreVersion : nil
              })
        else {
            return []
        }
        return appStoreVersions
    }

    public func getAvailableTerritories() -> [Territory] {
        guard let availableTerritoryIds = data.relationships?.availableTerritories?.data?.map(\.id),
              let availableTerritories = included?.compactMap({ relationship -> Territory? in
                  guard case let .territory(availableTerritory) = relationship else { return nil }
                  return availableTerritoryIds.contains(availableTerritory.id) ? availableTerritory : nil
              })
        else {
            return []
        }
        return availableTerritories
    }

    public func getBetaAppLocalizations() -> [BetaAppLocalization] {
        guard let betaAppLocalizationIds = data.relationships?.betaAppLocalizations?.data?.map(\.id),
              let betaAppLocalizations = included?.compactMap({ relationship -> BetaAppLocalization? in
                  guard case let .betaAppLocalization(betaAppLocalization) = relationship else { return nil }
                  return betaAppLocalizationIds.contains(betaAppLocalization.id) ? betaAppLocalization : nil
              })
        else {
            return []
        }
        return betaAppLocalizations
    }

    public func getBetaAppReviewDetail() -> BetaAppReviewDetail? {
        included?.compactMap { relationship -> BetaAppReviewDetail? in
            guard case let .betaAppReviewDetail(betaAppReviewDetail) = relationship else { return nil }
            return betaAppReviewDetail
        }.first { $0.id == data.relationships?.betaAppReviewDetail?.data?.id }
    }

    public func getBetaGroups() -> [BetaGroup] {
        guard let betaGroupIds = data.relationships?.betaGroups?.data?.map(\.id),
              let betaGroups = included?.compactMap({ relationship -> BetaGroup? in
                  guard case let .betaGroup(betaGroup) = relationship else { return nil }
                  return betaGroupIds.contains(betaGroup.id) ? betaGroup : nil
              })
        else {
            return []
        }
        return betaGroups
    }

    public func getBetaLicenseAgreement() -> BetaLicenseAgreement? {
        included?.compactMap { relationship -> BetaLicenseAgreement? in
            guard case let .betaLicenseAgreement(betaLicenseAgreement) = relationship else { return nil }
            return betaLicenseAgreement
        }.first { $0.id == data.relationships?.betaLicenseAgreement?.data?.id }
    }

    public func getBuilds() -> [Build] {
        guard let buildIds = data.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public func getCiProduct() -> CiProduct? {
        included?.compactMap { relationship -> CiProduct? in
            guard case let .ciProduct(ciProduct) = relationship else { return nil }
            return ciProduct
        }.first { $0.id == data.relationships?.ciProduct?.data?.id }
    }

    public func getEndUserLicenseAgreement() -> EndUserLicenseAgreement? {
        included?.compactMap { relationship -> EndUserLicenseAgreement? in
            guard case let .endUserLicenseAgreement(endUserLicenseAgreement) = relationship else { return nil }
            return endUserLicenseAgreement
        }.first { $0.id == data.relationships?.endUserLicenseAgreement?.data?.id }
    }

    public func getGameCenterEnabledVersions() -> [GameCenterEnabledVersion] {
        guard let gameCenterEnabledVersionIds = data.relationships?.gameCenterEnabledVersions?.data?.map(\.id),
              let gameCenterEnabledVersions = included?.compactMap({ relationship -> GameCenterEnabledVersion? in
                  guard case let .gameCenterEnabledVersion(gameCenterEnabledVersion) = relationship else { return nil }
                  return gameCenterEnabledVersionIds.contains(gameCenterEnabledVersion.id) ? gameCenterEnabledVersion : nil
              })
        else {
            return []
        }
        return gameCenterEnabledVersions
    }

    public func getInAppPurchases() -> [InAppPurchase] {
        guard let inAppPurchaseIds = data.relationships?.inAppPurchases?.data?.map(\.id),
              let inAppPurchases = included?.compactMap({ relationship -> InAppPurchase? in
                  guard case let .inAppPurchase(inAppPurchase) = relationship else { return nil }
                  return inAppPurchaseIds.contains(inAppPurchase.id) ? inAppPurchase : nil
              })
        else {
            return []
        }
        return inAppPurchases
    }

    public func getPreOrder() -> AppPreOrder? {
        included?.compactMap { relationship -> AppPreOrder? in
            guard case let .appPreOrder(preOrder) = relationship else { return nil }
            return preOrder
        }.first { $0.id == data.relationships?.preOrder?.data?.id }
    }

    public func getPreReleaseVersions() -> [PrereleaseVersion] {
        guard let preReleaseVersionIds = data.relationships?.preReleaseVersions?.data?.map(\.id),
              let preReleaseVersions = included?.compactMap({ relationship -> PrereleaseVersion? in
                  guard case let .prereleaseVersion(preReleaseVersion) = relationship else { return nil }
                  return preReleaseVersionIds.contains(preReleaseVersion.id) ? preReleaseVersion : nil
              })
        else {
            return []
        }
        return preReleaseVersions
    }

    public func getPrices() -> [AppPrice] {
        guard let priceIds = data.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> AppPrice? in
                  guard case let .appPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getReviewSubmissions() -> [ReviewSubmission] {
        guard let reviewSubmissionIds = data.relationships?.reviewSubmissions?.data?.map(\.id),
              let reviewSubmissions = included?.compactMap({ relationship -> ReviewSubmission? in
                  guard case let .reviewSubmission(reviewSubmission) = relationship else { return nil }
                  return reviewSubmissionIds.contains(reviewSubmission.id) ? reviewSubmission : nil
              })
        else {
            return []
        }
        return reviewSubmissions
    }

    public enum Included: Codable {
        case appClip(AppClip)
        case appCustomProductPage(AppCustomProductPage)
        case appEvent(AppEvent)
        case appInfo(AppInfo)
        case appPreOrder(AppPreOrder)
        case appPrice(AppPrice)
        case appStoreVersion(AppStoreVersion)
        case betaAppLocalization(BetaAppLocalization)
        case betaAppReviewDetail(BetaAppReviewDetail)
        case betaGroup(BetaGroup)
        case betaLicenseAgreement(BetaLicenseAgreement)
        case build(Build)
        case ciProduct(CiProduct)
        case endUserLicenseAgreement(EndUserLicenseAgreement)
        case gameCenterEnabledVersion(GameCenterEnabledVersion)
        case inAppPurchase(InAppPurchase)
        case prereleaseVersion(PrereleaseVersion)
        case reviewSubmission(ReviewSubmission)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let appClip = try? AppClip(from: decoder) {
                self = .appClip(appClip)
            } else if let appCustomProductPage = try? AppCustomProductPage(from: decoder) {
                self = .appCustomProductPage(appCustomProductPage)
            } else if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appInfo = try? AppInfo(from: decoder) {
                self = .appInfo(appInfo)
            } else if let appPreOrder = try? AppPreOrder(from: decoder) {
                self = .appPreOrder(appPreOrder)
            } else if let appPrice = try? AppPrice(from: decoder) {
                self = .appPrice(appPrice)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
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
            } else if let gameCenterEnabledVersion = try? GameCenterEnabledVersion(from: decoder) {
                self = .gameCenterEnabledVersion(gameCenterEnabledVersion)
            } else if let inAppPurchase = try? InAppPurchase(from: decoder) {
                self = .inAppPurchase(inAppPurchase)
            } else if let prereleaseVersion = try? PrereleaseVersion(from: decoder) {
                self = .prereleaseVersion(prereleaseVersion)
            } else if let reviewSubmission = try? ReviewSubmission(from: decoder) {
                self = .reviewSubmission(reviewSubmission)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
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
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .appInfo(value):
                try value.encode(to: encoder)
            case let .appPreOrder(value):
                try value.encode(to: encoder)
            case let .appPrice(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
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
            case let .gameCenterEnabledVersion(value):
                try value.encode(to: encoder)
            case let .inAppPurchase(value):
                try value.encode(to: encoder)
            case let .prereleaseVersion(value):
                try value.encode(to: encoder)
            case let .reviewSubmission(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
