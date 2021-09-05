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
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Profile], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case bundleId(BundleId)
        case certificates(Certificate)
        case devices(Device)

        public init(from decoder: Decoder) throws {
            if let bundleId = try? BundleId(from: decoder) {
                self = .bundleId(bundleId)
            } else if let certificates = try? Certificate(from: decoder) {
                self = .certificates(certificates)
            } else if let devices = try? Device(from: decoder) {
                self = .devices(devices)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .bundleId(value):
                try value.encode(to: encoder)
            case let .certificates(value):
                try value.encode(to: encoder)
            case let .devices(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case bundleId
            case certificates
            case devices
        }
    }
}
