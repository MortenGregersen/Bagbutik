import Foundation

/**
 A response that contains a single App Store Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionresponse>
 */
public struct AppStoreVersionResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersion
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersion, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case ageRatingDeclarations(AgeRatingDeclaration)
        case appStoreReviewDetails(AppStoreReviewDetail)
        case appStoreVersionLocalizations(AppStoreVersionLocalization)
        case appStoreVersionPhasedReleases(AppStoreVersionPhasedRelease)
        case appStoreVersionSubmissions(AppStoreVersionSubmission)
        case builds(Build)
        case idfaDeclarations(IdfaDeclaration)
        case routingAppCoverages(RoutingAppCoverage)

        public init(from decoder: Decoder) throws {
            if let ageRatingDeclarations = try? AgeRatingDeclaration(from: decoder) {
                self = .ageRatingDeclarations(ageRatingDeclarations)
            } else if let appStoreReviewDetails = try? AppStoreReviewDetail(from: decoder) {
                self = .appStoreReviewDetails(appStoreReviewDetails)
            } else if let appStoreVersionLocalizations = try? AppStoreVersionLocalization(from: decoder) {
                self = .appStoreVersionLocalizations(appStoreVersionLocalizations)
            } else if let appStoreVersionPhasedReleases = try? AppStoreVersionPhasedRelease(from: decoder) {
                self = .appStoreVersionPhasedReleases(appStoreVersionPhasedReleases)
            } else if let appStoreVersionSubmissions = try? AppStoreVersionSubmission(from: decoder) {
                self = .appStoreVersionSubmissions(appStoreVersionSubmissions)
            } else if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else if let idfaDeclarations = try? IdfaDeclaration(from: decoder) {
                self = .idfaDeclarations(idfaDeclarations)
            } else if let routingAppCoverages = try? RoutingAppCoverage(from: decoder) {
                self = .routingAppCoverages(routingAppCoverages)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .ageRatingDeclarations(value):
                try value.encode(to: encoder)
            case let .appStoreReviewDetails(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalizations(value):
                try value.encode(to: encoder)
            case let .appStoreVersionPhasedReleases(value):
                try value.encode(to: encoder)
            case let .appStoreVersionSubmissions(value):
                try value.encode(to: encoder)
            case let .builds(value):
                try value.encode(to: encoder)
            case let .idfaDeclarations(value):
                try value.encode(to: encoder)
            case let .routingAppCoverages(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case ageRatingDeclarations
            case appStoreReviewDetails
            case appStoreVersionLocalizations
            case appStoreVersionPhasedReleases
            case appStoreVersionSubmissions
            case builds
            case idfaDeclarations
            case routingAppCoverages
        }
    }
}
