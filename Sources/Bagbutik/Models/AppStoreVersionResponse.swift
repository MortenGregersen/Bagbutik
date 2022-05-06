import Foundation

/**
 A response that contains a single App Store Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionresponse>
 */
public struct AppStoreVersionResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersion
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersion, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAgeRatingDeclaration() -> AgeRatingDeclaration? {
        included?.compactMap { relationship -> AgeRatingDeclaration? in
            guard case let .ageRatingDeclaration(ageRatingDeclaration) = relationship else { return nil }
            return ageRatingDeclaration
        }.first { $0.id == data.relationships?.ageRatingDeclaration?.data?.id }
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

    public func getIdfaDeclaration() -> IdfaDeclaration? {
        included?.compactMap { relationship -> IdfaDeclaration? in
            guard case let .idfaDeclaration(idfaDeclaration) = relationship else { return nil }
            return idfaDeclaration
        }.first { $0.id == data.relationships?.idfaDeclaration?.data?.id }
    }

    public func getRoutingAppCoverage() -> RoutingAppCoverage? {
        included?.compactMap { relationship -> RoutingAppCoverage? in
            guard case let .routingAppCoverage(routingAppCoverage) = relationship else { return nil }
            return routingAppCoverage
        }.first { $0.id == data.relationships?.routingAppCoverage?.data?.id }
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
        case idfaDeclaration(IdfaDeclaration)
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
            } else if let idfaDeclaration = try? IdfaDeclaration(from: decoder) {
                self = .idfaDeclaration(idfaDeclaration)
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
            case let .idfaDeclaration(value):
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
