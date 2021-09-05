import Foundation

/**
 A response that contains a list of Builds resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildsresponse>
 */
public struct BuildsResponse: Codable, PagedResponse {
    public typealias Data = Build
    /// The resource data.
    public let data: [Build]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Build], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case app(App)
        case appEncryptionDeclaration(AppEncryptionDeclaration)
        case appStoreVersion(AppStoreVersion)
        case betaAppReviewSubmission(BetaAppReviewSubmission)
        case betaBuildLocalizations(BetaBuildLocalization)
        case betaTesters(BetaTester)
        case buildBetaDetail(BuildBetaDetail)
        case icons(BuildIcon)
        case preReleaseVersions(PrereleaseVersion)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appEncryptionDeclaration = try? AppEncryptionDeclaration(from: decoder) {
                self = .appEncryptionDeclaration(appEncryptionDeclaration)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let betaAppReviewSubmission = try? BetaAppReviewSubmission(from: decoder) {
                self = .betaAppReviewSubmission(betaAppReviewSubmission)
            } else if let betaBuildLocalizations = try? BetaBuildLocalization(from: decoder) {
                self = .betaBuildLocalizations(betaBuildLocalizations)
            } else if let betaTesters = try? BetaTester(from: decoder) {
                self = .betaTesters(betaTesters)
            } else if let buildBetaDetail = try? BuildBetaDetail(from: decoder) {
                self = .buildBetaDetail(buildBetaDetail)
            } else if let icons = try? BuildIcon(from: decoder) {
                self = .icons(icons)
            } else if let preReleaseVersions = try? PrereleaseVersion(from: decoder) {
                self = .preReleaseVersions(preReleaseVersions)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appEncryptionDeclaration(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .betaAppReviewSubmission(value):
                try value.encode(to: encoder)
            case let .betaBuildLocalizations(value):
                try value.encode(to: encoder)
            case let .betaTesters(value):
                try value.encode(to: encoder)
            case let .buildBetaDetail(value):
                try value.encode(to: encoder)
            case let .icons(value):
                try value.encode(to: encoder)
            case let .preReleaseVersions(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaTesters
            case buildBetaDetail
            case icons
            case preReleaseVersions
        }
    }
}
