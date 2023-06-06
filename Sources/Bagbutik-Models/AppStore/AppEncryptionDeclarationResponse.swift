import Bagbutik_Core
import Foundation

/**
 # AppEncryptionDeclarationResponse
 A response that contains a single App Encryption Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationresponse>
 */
public struct AppEncryptionDeclarationResponse: Codable {
    /// The resource data.
    public let data: AppEncryptionDeclaration
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppEncryptionDeclaration,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppEncryptionDeclarationDocument() -> AppEncryptionDeclarationDocument? {
        included?.compactMap { relationship -> AppEncryptionDeclarationDocument? in
            guard case let .appEncryptionDeclarationDocument(appEncryptionDeclarationDocument) = relationship else { return nil }
            return appEncryptionDeclarationDocument
        }.first { $0.id == data.relationships?.appEncryptionDeclarationDocument?.data?.id }
    }

    public enum Included: Codable {
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
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
