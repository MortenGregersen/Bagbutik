import Foundation

/**
 A response that contains a single Bundle IDs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidresponse>
 */
public struct BundleIdResponse: Codable {
    /// The resource data.
    public let data: BundleId
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BundleId, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case app(App)
        case bundleIdCapability(BundleIdCapability)
        case profile(Profile)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let bundleIdCapability = try? BundleIdCapability(from: decoder) {
                self = .bundleIdCapability(bundleIdCapability)
            } else if let profile = try? Profile(from: decoder) {
                self = .profile(profile)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .bundleIdCapability(value):
                try value.encode(to: encoder)
            case let .profile(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
