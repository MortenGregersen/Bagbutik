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
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: App, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
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
