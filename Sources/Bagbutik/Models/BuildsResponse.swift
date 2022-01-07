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
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

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
        case betaBuildLocalization(BetaBuildLocalization)
        case betaTester(BetaTester)
        case buildBetaDetail(BuildBetaDetail)
        case buildBundle(BuildBundle)
        case buildIcon(BuildIcon)
        case prereleaseVersion(PrereleaseVersion)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appEncryptionDeclaration = try? AppEncryptionDeclaration(from: decoder) {
                self = .appEncryptionDeclaration(appEncryptionDeclaration)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let betaAppReviewSubmission = try? BetaAppReviewSubmission(from: decoder) {
                self = .betaAppReviewSubmission(betaAppReviewSubmission)
            } else if let betaBuildLocalization = try? BetaBuildLocalization(from: decoder) {
                self = .betaBuildLocalization(betaBuildLocalization)
            } else if let betaTester = try? BetaTester(from: decoder) {
                self = .betaTester(betaTester)
            } else if let buildBetaDetail = try? BuildBetaDetail(from: decoder) {
                self = .buildBetaDetail(buildBetaDetail)
            } else if let buildBundle = try? BuildBundle(from: decoder) {
                self = .buildBundle(buildBundle)
            } else if let buildIcon = try? BuildIcon(from: decoder) {
                self = .buildIcon(buildIcon)
            } else if let prereleaseVersion = try? PrereleaseVersion(from: decoder) {
                self = .prereleaseVersion(prereleaseVersion)
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
            case let .betaBuildLocalization(value):
                try value.encode(to: encoder)
            case let .betaTester(value):
                try value.encode(to: encoder)
            case let .buildBetaDetail(value):
                try value.encode(to: encoder)
            case let .buildBundle(value):
                try value.encode(to: encoder)
            case let .buildIcon(value):
                try value.encode(to: encoder)
            case let .prereleaseVersion(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
