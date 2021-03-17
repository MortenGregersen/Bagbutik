import Foundation

/**
 A response that contains a single Apps resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appresponse>
 */
public struct AppResponse: Codable {
    /// The resource data.
    public let data: App
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: App, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appInfos(AppInfo)
        case appPreOrders(AppPreOrder)
        case appPrices(AppPrice)
        case appStoreVersions(AppStoreVersion)
        case betaAppLocalizations(BetaAppLocalization)
        case betaAppReviewDetails(BetaAppReviewDetail)
        case betaGroups(BetaGroup)
        case betaLicenseAgreements(BetaLicenseAgreement)
        case builds(Build)
        case endUserLicenseAgreements(EndUserLicenseAgreement)
        case gameCenterEnabledVersions(GameCenterEnabledVersion)
        case inAppPurchases(InAppPurchase)
        case perfPowerMetrics(PerfPowerMetric)
        case preReleaseVersions(PrereleaseVersion)
        case territories(Territory)

        public init(from decoder: Decoder) throws {
            if let appInfos = try? AppInfo(from: decoder) {
                self = .appInfos(appInfos)
            } else if let appPreOrders = try? AppPreOrder(from: decoder) {
                self = .appPreOrders(appPreOrders)
            } else if let appPrices = try? AppPrice(from: decoder) {
                self = .appPrices(appPrices)
            } else if let appStoreVersions = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersions(appStoreVersions)
            } else if let betaAppLocalizations = try? BetaAppLocalization(from: decoder) {
                self = .betaAppLocalizations(betaAppLocalizations)
            } else if let betaAppReviewDetails = try? BetaAppReviewDetail(from: decoder) {
                self = .betaAppReviewDetails(betaAppReviewDetails)
            } else if let betaGroups = try? BetaGroup(from: decoder) {
                self = .betaGroups(betaGroups)
            } else if let betaLicenseAgreements = try? BetaLicenseAgreement(from: decoder) {
                self = .betaLicenseAgreements(betaLicenseAgreements)
            } else if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else if let endUserLicenseAgreements = try? EndUserLicenseAgreement(from: decoder) {
                self = .endUserLicenseAgreements(endUserLicenseAgreements)
            } else if let gameCenterEnabledVersions = try? GameCenterEnabledVersion(from: decoder) {
                self = .gameCenterEnabledVersions(gameCenterEnabledVersions)
            } else if let inAppPurchases = try? InAppPurchase(from: decoder) {
                self = .inAppPurchases(inAppPurchases)
            } else if let perfPowerMetrics = try? PerfPowerMetric(from: decoder) {
                self = .perfPowerMetrics(perfPowerMetrics)
            } else if let preReleaseVersions = try? PrereleaseVersion(from: decoder) {
                self = .preReleaseVersions(preReleaseVersions)
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
            case let .appPrices(value):
                try value.encode(to: encoder)
            case let .appStoreVersions(value):
                try value.encode(to: encoder)
            case let .betaAppLocalizations(value):
                try value.encode(to: encoder)
            case let .betaAppReviewDetails(value):
                try value.encode(to: encoder)
            case let .betaGroups(value):
                try value.encode(to: encoder)
            case let .betaLicenseAgreements(value):
                try value.encode(to: encoder)
            case let .builds(value):
                try value.encode(to: encoder)
            case let .endUserLicenseAgreements(value):
                try value.encode(to: encoder)
            case let .gameCenterEnabledVersions(value):
                try value.encode(to: encoder)
            case let .inAppPurchases(value):
                try value.encode(to: encoder)
            case let .perfPowerMetrics(value):
                try value.encode(to: encoder)
            case let .preReleaseVersions(value):
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
            case appPrices
            case appStoreVersions
            case betaAppLocalizations
            case betaAppReviewDetails
            case betaGroups
            case betaLicenseAgreements
            case builds
            case endUserLicenseAgreements
            case gameCenterEnabledVersions
            case inAppPurchases
            case perfPowerMetrics
            case preReleaseVersions
            case territories
        }
    }
}
