import Foundation

/**
 A response that contains a list of Profiles resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profilesresponse>
 */
public struct ProfilesResponse: Codable, PagedResponse {
    public typealias Data = Profile
    /// The resource data.
    public let data: [Profile]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [Profile], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case bundleId(BundleId)
        case certificate(Certificate)
        case device(Device)

        public init(from decoder: Decoder) throws {
            if let bundleId = try? BundleId(from: decoder) {
                self = .bundleId(bundleId)
            } else if let certificate = try? Certificate(from: decoder) {
                self = .certificate(certificate)
            } else if let device = try? Device(from: decoder) {
                self = .device(device)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .bundleId(value):
                try value.encode(to: encoder)
            case let .certificate(value):
                try value.encode(to: encoder)
            case let .device(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
