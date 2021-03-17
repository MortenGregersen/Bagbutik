import Foundation

/**
 A response that contains a single Profiles resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profileresponse>
 */
public struct ProfileResponse: Codable {
    /// The resource data.
    public let data: Profile
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Profile, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case bundleIds(BundleId)
        case certificates(Certificate)
        case devices(Device)

        public init(from decoder: Decoder) throws {
            if let bundleIds = try? BundleId(from: decoder) {
                self = .bundleIds(bundleIds)
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
            case let .bundleIds(value):
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
            case bundleIds
            case certificates
            case devices
        }
    }
}
