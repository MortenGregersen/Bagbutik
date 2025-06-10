import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppEncryptionDeclarationsResponse
 A response that contains a list of App Encryption Declaration resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationsresponse>
 */
public struct AppEncryptionDeclarationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppEncryptionDeclaration

    /// The resource data.
    public let data: [AppEncryptionDeclaration]
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [AppEncryptionDeclaration],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AppEncryptionDeclaration].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getAppEncryptionDeclarationDocument(for appEncryptionDeclaration: AppEncryptionDeclaration) -> AppEncryptionDeclarationDocument? {
        included?.compactMap { relationship -> AppEncryptionDeclarationDocument? in
            guard case let .appEncryptionDeclarationDocument(appEncryptionDeclarationDocument) = relationship else { return nil }
            return appEncryptionDeclarationDocument
        }.first { $0.id == appEncryptionDeclaration.relationships?.appEncryptionDeclarationDocument?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case appEncryptionDeclarationDocument(AppEncryptionDeclarationDocument)
        case build(Build)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appEncryptionDeclarationDocument = try? AppEncryptionDeclarationDocument(from: decoder) {
                self = .appEncryptionDeclarationDocument(appEncryptionDeclarationDocument)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appEncryptionDeclarationDocument(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            }
        }
    }
}
