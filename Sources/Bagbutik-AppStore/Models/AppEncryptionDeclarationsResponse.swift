import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppEncryptionDeclarationsResponse
 A response containing a list of encryption declarations for an app.

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

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    public func getApp(for appEncryptionDeclaration: AppEncryptionDeclaration) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appEncryptionDeclaration.relationships?.app?.data?.id }
    }

    public func getAppEncryptionDeclarationDocument(for appEncryptionDeclaration: AppEncryptionDeclaration) -> AppEncryptionDeclarationDocument? {
        included?.compactMap { relationship -> AppEncryptionDeclarationDocument? in
            guard case let .appEncryptionDeclarationDocument(appEncryptionDeclarationDocument) = relationship else { return nil }
            return appEncryptionDeclarationDocument
        }.first { $0.id == appEncryptionDeclaration.relationships?.appEncryptionDeclarationDocument?.data?.id }
    }

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    public func getBuilds(for appEncryptionDeclaration: AppEncryptionDeclaration) -> [Build] {
        guard let buildIds = appEncryptionDeclaration.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case appEncryptionDeclarationDocument(AppEncryptionDeclarationDocument)
        case build(Build)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "appEncryptionDeclarationDocuments":
                self = .appEncryptionDeclarationDocument(try AppEncryptionDeclarationDocument(from: decoder))
            case "builds":
                self = .build(try Build(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
