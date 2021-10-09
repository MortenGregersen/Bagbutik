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
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersion, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case ageRatingDeclaration(AgeRatingDeclaration)
        case app(App)
        case appStoreReviewDetail(AppStoreReviewDetail)
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
            } else if let appStoreReviewDetail = try? AppStoreReviewDetail(from: decoder) {
                self = .appStoreReviewDetail(appStoreReviewDetail)
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
            case let .appStoreReviewDetail(value):
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

        private enum TypeKeys: String, Codable {
            case ageRatingDeclaration
            case app
            case appStoreReviewDetail
            case appStoreVersionLocalization
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case idfaDeclaration
            case routingAppCoverage
        }
    }
}
