import Foundation

/**
 A response that contains a list of Bundle ID resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidsresponse>
 */
public struct BundleIdsResponse: Codable, PagedResponse {
    public typealias Data = BundleId
    /// The resource data.
    public let data: [BundleId]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BundleId], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getApp(for bundleId: BundleId) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == bundleId.relationships?.app?.data?.id }
    }

    public func getBundleIdCapabilities(for bundleId: BundleId) -> [BundleIdCapability] {
        guard let bundleIdCapabilityIds = bundleId.relationships?.bundleIdCapabilities?.data?.map(\.id),
              let bundleIdCapabilities = included?.compactMap({ relationship -> BundleIdCapability? in
                  guard case let .bundleIdCapability(bundleIdCapability) = relationship else { return nil }
                  return bundleIdCapabilityIds.contains(bundleIdCapability.id) ? bundleIdCapability : nil
              })
        else {
            return []
        }
        return bundleIdCapabilities
    }

    public func getProfiles(for bundleId: BundleId) -> [Profile] {
        guard let profileIds = bundleId.relationships?.profiles?.data?.map(\.id),
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
