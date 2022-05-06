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
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BundleId, included: [Included]? = nil, links: DocumentLinks) {
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

    public func getBundleIdCapabilities() -> [BundleIdCapability] {
        guard let bundleIdCapabilityIds = data.relationships?.bundleIdCapabilities?.data?.map(\.id),
              let bundleIdCapabilities = included?.compactMap({ relationship -> BundleIdCapability? in
                  guard case let .bundleIdCapability(bundleIdCapability) = relationship else { return nil }
                  return bundleIdCapabilityIds.contains(bundleIdCapability.id) ? bundleIdCapability : nil
              })
        else {
            return []
        }
        return bundleIdCapabilities
    }

    public func getProfiles() -> [Profile] {
        guard let profileIds = data.relationships?.profiles?.data?.map(\.id),
              let profiles = included?.compactMap({ relationship -> Profile? in
                  guard case let .profile(profile) = relationship else { return nil }
                  return profileIds.contains(profile.id) ? profile : nil
              })
        else {
            return []
        }
        return profiles
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
