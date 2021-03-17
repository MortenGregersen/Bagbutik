import Foundation

/**
 A response that contains a single Bundle IDs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidresponse>
 */
public struct BundleIdResponse: Codable {
    /// The resource data.
    public let data: BundleId
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BundleId, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case apps(App)
        case bundleIdCapabilities(BundleIdCapability)
        case profiles(Profile)

        public init(from decoder: Decoder) throws {
            if let apps = try? App(from: decoder) {
                self = .apps(apps)
            } else if let bundleIdCapabilities = try? BundleIdCapability(from: decoder) {
                self = .bundleIdCapabilities(bundleIdCapabilities)
            } else if let profiles = try? Profile(from: decoder) {
                self = .profiles(profiles)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .apps(value):
                try value.encode(to: encoder)
            case let .bundleIdCapabilities(value):
                try value.encode(to: encoder)
            case let .profiles(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case apps
            case bundleIdCapabilities
            case profiles
        }
    }
}
