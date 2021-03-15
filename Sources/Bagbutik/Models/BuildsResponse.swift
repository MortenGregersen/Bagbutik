import Foundation

/// A response that contains a list of Builds resources.
public struct BuildsResponse: Codable {
    /// The resource data.
    public let data: [Build]
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
        case appEncryptionDeclarations(AppEncryptionDeclaration)
        case appStoreVersions(AppStoreVersion)
        case apps(App)
        case betaAppReviewSubmissions(BetaAppReviewSubmission)
        case betaBuildLocalizations(BetaBuildLocalization)
        case betaTesters(BetaTester)
        case buildBetaDetails(BuildBetaDetail)
        case diagnosticSignatures(DiagnosticSignature)
        case icons(BuildIcon)
        case perfPowerMetrics(PerfPowerMetric)
        case preReleaseVersions(PrereleaseVersion)

        public init(from decoder: Decoder) throws {
            if let appEncryptionDeclarations = try? AppEncryptionDeclaration(from: decoder) {
                self = .appEncryptionDeclarations(appEncryptionDeclarations)
            } else if let appStoreVersions = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersions(appStoreVersions)
            } else if let apps = try? App(from: decoder) {
                self = .apps(apps)
            } else if let betaAppReviewSubmissions = try? BetaAppReviewSubmission(from: decoder) {
                self = .betaAppReviewSubmissions(betaAppReviewSubmissions)
            } else if let betaBuildLocalizations = try? BetaBuildLocalization(from: decoder) {
                self = .betaBuildLocalizations(betaBuildLocalizations)
            } else if let betaTesters = try? BetaTester(from: decoder) {
                self = .betaTesters(betaTesters)
            } else if let buildBetaDetails = try? BuildBetaDetail(from: decoder) {
                self = .buildBetaDetails(buildBetaDetails)
            } else if let diagnosticSignatures = try? DiagnosticSignature(from: decoder) {
                self = .diagnosticSignatures(diagnosticSignatures)
            } else if let icons = try? BuildIcon(from: decoder) {
                self = .icons(icons)
            } else if let perfPowerMetrics = try? PerfPowerMetric(from: decoder) {
                self = .perfPowerMetrics(perfPowerMetrics)
            } else if let preReleaseVersions = try? PrereleaseVersion(from: decoder) {
                self = .preReleaseVersions(preReleaseVersions)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appEncryptionDeclarations(value):
                try value.encode(to: encoder)
            case let .appStoreVersions(value):
                try value.encode(to: encoder)
            case let .apps(value):
                try value.encode(to: encoder)
            case let .betaAppReviewSubmissions(value):
                try value.encode(to: encoder)
            case let .betaBuildLocalizations(value):
                try value.encode(to: encoder)
            case let .betaTesters(value):
                try value.encode(to: encoder)
            case let .buildBetaDetails(value):
                try value.encode(to: encoder)
            case let .diagnosticSignatures(value):
                try value.encode(to: encoder)
            case let .icons(value):
                try value.encode(to: encoder)
            case let .perfPowerMetrics(value):
                try value.encode(to: encoder)
            case let .preReleaseVersions(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case appEncryptionDeclarations
            case appStoreVersions
            case apps
            case betaAppReviewSubmissions
            case betaBuildLocalizations
            case betaTesters
            case buildBetaDetails
            case diagnosticSignatures
            case icons
            case perfPowerMetrics
            case preReleaseVersions
        }
    }
}
