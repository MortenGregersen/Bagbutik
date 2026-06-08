import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionResponse
 A response that contains a single App Store Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionresponse>
 */
public struct AppStoreVersionResponse: Codable, Sendable {
    public let data: AppStoreVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppStoreVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAlternativeDistributionPackage() -> AlternativeDistributionPackage? {
        included?.compactMap { relationship -> AlternativeDistributionPackage? in
            guard case let .alternativeDistributionPackage(alternativeDistributionPackage) = relationship else { return nil }
            return alternativeDistributionPackage
        }.first { $0.id == data.relationships?.alternativeDistributionPackage?.data?.id }
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppClipDefaultExperience() -> AppClipDefaultExperience? {
        included?.compactMap { relationship -> AppClipDefaultExperience? in
            guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
            return appClipDefaultExperience
        }.first { $0.id == data.relationships?.appClipDefaultExperience?.data?.id }
    }

    public func getAppStoreReviewDetail() -> AppStoreReviewDetail? {
        included?.compactMap { relationship -> AppStoreReviewDetail? in
            guard case let .appStoreReviewDetail(appStoreReviewDetail) = relationship else { return nil }
            return appStoreReviewDetail
        }.first { $0.id == data.relationships?.appStoreReviewDetail?.data?.id }
    }

    public func getAppStoreVersionExperiments() -> [AppStoreVersionExperiment] {
        guard let appStoreVersionExperimentIds = data.relationships?.appStoreVersionExperiments?.data?.map(\.id),
              let appStoreVersionExperiments = included?.compactMap({ relationship -> AppStoreVersionExperiment? in
                  guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
                  return appStoreVersionExperimentIds.contains(appStoreVersionExperiment.id) ? appStoreVersionExperiment : nil
              })
        else {
            return []
        }
        return appStoreVersionExperiments
    }

    public func getAppStoreVersionExperimentsV2() -> [AppStoreVersionExperiment] {
        guard let appStoreVersionExperimentsV2Ids = data.relationships?.appStoreVersionExperimentsV2?.data?.map(\.id),
              let appStoreVersionExperimentsV2 = included?.compactMap({ relationship -> AppStoreVersionExperiment? in
                  guard case let .appStoreVersionExperiment(appStoreVersionExperimentsV2) = relationship else { return nil }
                  return appStoreVersionExperimentsV2Ids.contains(appStoreVersionExperimentsV2.id) ? appStoreVersionExperimentsV2 : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentsV2
    }

    public func getAppStoreVersionLocalizations() -> [AppStoreVersionLocalization] {
        guard let appStoreVersionLocalizationIds = data.relationships?.appStoreVersionLocalizations?.data?.map(\.id),
              let appStoreVersionLocalizations = included?.compactMap({ relationship -> AppStoreVersionLocalization? in
                  guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
                  return appStoreVersionLocalizationIds.contains(appStoreVersionLocalization.id) ? appStoreVersionLocalization : nil
              })
        else {
            return []
        }
        return appStoreVersionLocalizations
    }

    public func getAppStoreVersionPhasedRelease() -> AppStoreVersionPhasedRelease? {
        included?.compactMap { relationship -> AppStoreVersionPhasedRelease? in
            guard case let .appStoreVersionPhasedRelease(appStoreVersionPhasedRelease) = relationship else { return nil }
            return appStoreVersionPhasedRelease
        }.first { $0.id == data.relationships?.appStoreVersionPhasedRelease?.data?.id }
    }

    public func getAppStoreVersionSubmission() -> AppStoreVersionSubmission? {
        included?.compactMap { relationship -> AppStoreVersionSubmission? in
            guard case let .appStoreVersionSubmission(appStoreVersionSubmission) = relationship else { return nil }
            return appStoreVersionSubmission
        }.first { $0.id == data.relationships?.appStoreVersionSubmission?.data?.id }
    }

    public func getBuild() -> Build? {
        included?.compactMap { relationship -> Build? in
            guard case let .build(build) = relationship else { return nil }
            return build
        }.first { $0.id == data.relationships?.build?.data?.id }
    }

    public func getGameCenterAppVersion() -> GameCenterAppVersion? {
        included?.compactMap { relationship -> GameCenterAppVersion? in
            guard case let .gameCenterAppVersion(gameCenterAppVersion) = relationship else { return nil }
            return gameCenterAppVersion
        }.first { $0.id == data.relationships?.gameCenterAppVersion?.data?.id }
    }

    public func getRoutingAppCoverage() -> RoutingAppCoverage? {
        included?.compactMap { relationship -> RoutingAppCoverage? in
            guard case let .routingAppCoverage(routingAppCoverage) = relationship else { return nil }
            return routingAppCoverage
        }.first { $0.id == data.relationships?.routingAppCoverage?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case alternativeDistributionPackage(AlternativeDistributionPackage)
        case app(App)
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appStoreReviewDetail(AppStoreReviewDetail)
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionLocalization(AppStoreVersionLocalization)
        case appStoreVersionPhasedRelease(AppStoreVersionPhasedRelease)
        case appStoreVersionSubmission(AppStoreVersionSubmission)
        case build(Build)
        case gameCenterAppVersion(GameCenterAppVersion)
        case routingAppCoverage(RoutingAppCoverage)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "alternativeDistributionPackages":
                self = .alternativeDistributionPackage(try AlternativeDistributionPackage(from: decoder))
            case "apps":
                self = .app(try App(from: decoder))
            case "appClipDefaultExperiences":
                self = .appClipDefaultExperience(try AppClipDefaultExperience(from: decoder))
            case "appStoreReviewDetails":
                self = .appStoreReviewDetail(try AppStoreReviewDetail(from: decoder))
            case "appStoreVersionExperiments":
                self = .appStoreVersionExperiment(try AppStoreVersionExperiment(from: decoder))
            case "appStoreVersionLocalizations":
                self = .appStoreVersionLocalization(try AppStoreVersionLocalization(from: decoder))
            case "appStoreVersionPhasedReleases":
                self = .appStoreVersionPhasedRelease(try AppStoreVersionPhasedRelease(from: decoder))
            case "appStoreVersionSubmissions":
                self = .appStoreVersionSubmission(try AppStoreVersionSubmission(from: decoder))
            case "builds":
                self = .build(try Build(from: decoder))
            case "gameCenterAppVersions":
                self = .gameCenterAppVersion(try GameCenterAppVersion(from: decoder))
            case "routingAppCoverages":
                self = .routingAppCoverage(try RoutingAppCoverage(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .alternativeDistributionPackage(value):
                try value.encode(to: encoder)
            case let .app(value):
                try value.encode(to: encoder)
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            case let .appStoreReviewDetail(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperiment(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionPhasedRelease(value):
                try value.encode(to: encoder)
            case let .appStoreVersionSubmission(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            case let .gameCenterAppVersion(value):
                try value.encode(to: encoder)
            case let .routingAppCoverage(value):
                try value.encode(to: encoder)
            }
        }
    }
}
