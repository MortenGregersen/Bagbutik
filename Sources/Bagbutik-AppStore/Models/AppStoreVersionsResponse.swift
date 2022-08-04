import Foundation

/**
 # AppStoreVersionsResponse
 A response that contains a list of App Store Version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsresponse>
 */
public struct AppStoreVersionsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreVersion

    public let data: [AppStoreVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersion],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getApp(for appStoreVersion: AppStoreVersion) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appStoreVersion.relationships?.app?.data?.id }
    }

    public func getAppClipDefaultExperience(for appStoreVersion: AppStoreVersion) -> AppClipDefaultExperience? {
        included?.compactMap { relationship -> AppClipDefaultExperience? in
            guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
            return appClipDefaultExperience
        }.first { $0.id == appStoreVersion.relationships?.appClipDefaultExperience?.data?.id }
    }

    public func getAppStoreReviewDetail(for appStoreVersion: AppStoreVersion) -> AppStoreReviewDetail? {
        included?.compactMap { relationship -> AppStoreReviewDetail? in
            guard case let .appStoreReviewDetail(appStoreReviewDetail) = relationship else { return nil }
            return appStoreReviewDetail
        }.first { $0.id == appStoreVersion.relationships?.appStoreReviewDetail?.data?.id }
    }

    public func getAppStoreVersionExperiments(for appStoreVersion: AppStoreVersion) -> [AppStoreVersionExperiment] {
        guard let appStoreVersionExperimentIds = appStoreVersion.relationships?.appStoreVersionExperiments?.data?.map(\.id),
              let appStoreVersionExperiments = included?.compactMap({ relationship -> AppStoreVersionExperiment? in
                  guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
                  return appStoreVersionExperimentIds.contains(appStoreVersionExperiment.id) ? appStoreVersionExperiment : nil
              })
        else {
            return []
        }
        return appStoreVersionExperiments
    }

    public func getAppStoreVersionLocalizations(for appStoreVersion: AppStoreVersion) -> [AppStoreVersionLocalization] {
        guard let appStoreVersionLocalizationIds = appStoreVersion.relationships?.appStoreVersionLocalizations?.data?.map(\.id),
              let appStoreVersionLocalizations = included?.compactMap({ relationship -> AppStoreVersionLocalization? in
                  guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
                  return appStoreVersionLocalizationIds.contains(appStoreVersionLocalization.id) ? appStoreVersionLocalization : nil
              })
        else {
            return []
        }
        return appStoreVersionLocalizations
    }

    public func getAppStoreVersionPhasedRelease(for appStoreVersion: AppStoreVersion) -> AppStoreVersionPhasedRelease? {
        included?.compactMap { relationship -> AppStoreVersionPhasedRelease? in
            guard case let .appStoreVersionPhasedRelease(appStoreVersionPhasedRelease) = relationship else { return nil }
            return appStoreVersionPhasedRelease
        }.first { $0.id == appStoreVersion.relationships?.appStoreVersionPhasedRelease?.data?.id }
    }

    public func getAppStoreVersionSubmission(for appStoreVersion: AppStoreVersion) -> AppStoreVersionSubmission? {
        included?.compactMap { relationship -> AppStoreVersionSubmission? in
            guard case let .appStoreVersionSubmission(appStoreVersionSubmission) = relationship else { return nil }
            return appStoreVersionSubmission
        }.first { $0.id == appStoreVersion.relationships?.appStoreVersionSubmission?.data?.id }
    }

    public func getBuild(for appStoreVersion: AppStoreVersion) -> Build? {
        included?.compactMap { relationship -> Build? in
            guard case let .build(build) = relationship else { return nil }
            return build
        }.first { $0.id == appStoreVersion.relationships?.build?.data?.id }
    }

    public func getRoutingAppCoverage(for appStoreVersion: AppStoreVersion) -> RoutingAppCoverage? {
        included?.compactMap { relationship -> RoutingAppCoverage? in
            guard case let .routingAppCoverage(routingAppCoverage) = relationship else { return nil }
            return routingAppCoverage
        }.first { $0.id == appStoreVersion.relationships?.routingAppCoverage?.data?.id }
    }

    public enum Included: Codable {
        case ageRatingDeclaration(AgeRatingDeclaration)
        case app(App)
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appStoreReviewDetail(AppStoreReviewDetail)
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionLocalization(AppStoreVersionLocalization)
        case appStoreVersionPhasedRelease(AppStoreVersionPhasedRelease)
        case appStoreVersionSubmission(AppStoreVersionSubmission)
        case build(Build)
        case routingAppCoverage(RoutingAppCoverage)

        public init(from decoder: Decoder) throws {
            if let ageRatingDeclaration = try? AgeRatingDeclaration(from: decoder) {
                self = .ageRatingDeclaration(ageRatingDeclaration)
            } else if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appClipDefaultExperience = try? AppClipDefaultExperience(from: decoder) {
                self = .appClipDefaultExperience(appClipDefaultExperience)
            } else if let appStoreReviewDetail = try? AppStoreReviewDetail(from: decoder) {
                self = .appStoreReviewDetail(appStoreReviewDetail)
            } else if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else if let appStoreVersionLocalization = try? AppStoreVersionLocalization(from: decoder) {
                self = .appStoreVersionLocalization(appStoreVersionLocalization)
            } else if let appStoreVersionPhasedRelease = try? AppStoreVersionPhasedRelease(from: decoder) {
                self = .appStoreVersionPhasedRelease(appStoreVersionPhasedRelease)
            } else if let appStoreVersionSubmission = try? AppStoreVersionSubmission(from: decoder) {
                self = .appStoreVersionSubmission(appStoreVersionSubmission)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
            } else if let routingAppCoverage = try? RoutingAppCoverage(from: decoder) {
                self = .routingAppCoverage(routingAppCoverage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .ageRatingDeclaration(value):
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
            case let .routingAppCoverage(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
