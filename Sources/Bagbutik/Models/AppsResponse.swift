import Foundation

/**
 A response that contains a list of Apps resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appsresponse>
 */
public struct AppsResponse: Codable, PagedResponse {
    public typealias Data = App
    /// The resource data.
    public let data: [App]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [App], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case appInfos(AppInfo)
        case appPreOrders(AppPreOrder)
        case appStoreVersions(AppStoreVersion)
        case betaAppLocalizations(BetaAppLocalization)
        case betaAppReviewDetail(BetaAppReviewDetail)
        case betaGroups(BetaGroup)
        case betaLicenseAgreement(BetaLicenseAgreement)
        case builds(Build)
        case ciProduct(CiProduct)
        case endUserLicenseAgreement(EndUserLicenseAgreement)
        case gameCenterEnabledVersions(GameCenterEnabledVersion)
        case inAppPurchases(InAppPurchase)
        case preReleaseVersions(PrereleaseVersion)
        case prices(AppPrice)
        case territories(Territory)

        public init(from decoder: Decoder) throws {
            if let appInfos = try? AppInfo(from: decoder) {
                self = .appInfos(appInfos)
            } else if let appPreOrders = try? AppPreOrder(from: decoder) {
                self = .appPreOrders(appPreOrders)
            } else if let appStoreVersions = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersions(appStoreVersions)
            } else if let betaAppLocalizations = try? BetaAppLocalization(from: decoder) {
                self = .betaAppLocalizations(betaAppLocalizations)
            } else if let betaAppReviewDetail = try? BetaAppReviewDetail(from: decoder) {
                self = .betaAppReviewDetail(betaAppReviewDetail)
            } else if let betaGroups = try? BetaGroup(from: decoder) {
                self = .betaGroups(betaGroups)
            } else if let betaLicenseAgreement = try? BetaLicenseAgreement(from: decoder) {
                self = .betaLicenseAgreement(betaLicenseAgreement)
            } else if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else if let ciProduct = try? CiProduct(from: decoder) {
                self = .ciProduct(ciProduct)
            } else if let endUserLicenseAgreement = try? EndUserLicenseAgreement(from: decoder) {
                self = .endUserLicenseAgreement(endUserLicenseAgreement)
            } else if let gameCenterEnabledVersions = try? GameCenterEnabledVersion(from: decoder) {
                self = .gameCenterEnabledVersions(gameCenterEnabledVersions)
            } else if let inAppPurchases = try? InAppPurchase(from: decoder) {
                self = .inAppPurchases(inAppPurchases)
            } else if let preReleaseVersions = try? PrereleaseVersion(from: decoder) {
                self = .preReleaseVersions(preReleaseVersions)
            } else if let prices = try? AppPrice(from: decoder) {
                self = .prices(prices)
            } else if let territories = try? Territory(from: decoder) {
                self = .territories(territories)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appInfos(value):
                try value.encode(to: encoder)
            case let .appPreOrders(value):
                try value.encode(to: encoder)
            case let .appStoreVersions(value):
                try value.encode(to: encoder)
            case let .betaAppLocalizations(value):
                try value.encode(to: encoder)
            case let .betaAppReviewDetail(value):
                try value.encode(to: encoder)
            case let .betaGroups(value):
                try value.encode(to: encoder)
            case let .betaLicenseAgreement(value):
                try value.encode(to: encoder)
            case let .builds(value):
                try value.encode(to: encoder)
            case let .ciProduct(value):
                try value.encode(to: encoder)
            case let .endUserLicenseAgreement(value):
                try value.encode(to: encoder)
            case let .gameCenterEnabledVersions(value):
                try value.encode(to: encoder)
            case let .inAppPurchases(value):
                try value.encode(to: encoder)
            case let .preReleaseVersions(value):
                try value.encode(to: encoder)
            case let .prices(value):
                try value.encode(to: encoder)
            case let .territories(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appInfos
            case appPreOrders
            case appStoreVersions
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case builds
            case ciProduct
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case preReleaseVersions
            case prices
            case territories
        }
    }
}
