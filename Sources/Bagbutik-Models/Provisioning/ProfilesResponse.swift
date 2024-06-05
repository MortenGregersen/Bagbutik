import Bagbutik_Core
import Foundation

/**
 # ProfilesResponse
 A response that contains a list of Profiles resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profilesresponse>
 */
public struct ProfilesResponse: Codable, PagedResponse {
    public typealias Data = Profile

    /// The resource data.
    public let data: [Profile]
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [Profile],
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
        data = try container.decode([Profile].self, forKey: "data")
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

    public func getBundleId(for profile: Profile) -> BundleId? {
        included?.compactMap { relationship -> BundleId? in
            guard case let .bundleId(bundleId) = relationship else { return nil }
            return bundleId
        }.first { $0.id == profile.relationships?.bundleId?.data?.id }
    }

    public func getCertificates(for profile: Profile) -> [Certificate] {
        guard let certificateIds = profile.relationships?.certificates?.data?.map(\.id),
              let certificates = included?.compactMap({ relationship -> Certificate? in
                  guard case let .certificate(certificate) = relationship else { return nil }
                  return certificateIds.contains(certificate.id) ? certificate : nil
              })
        else {
            return []
        }
        return certificates
    }

    public func getDevices(for profile: Profile) -> [Device] {
        guard let deviceIds = profile.relationships?.devices?.data?.map(\.id),
              let devices = included?.compactMap({ relationship -> Device? in
                  guard case let .device(device) = relationship else { return nil }
                  return deviceIds.contains(device.id) ? device : nil
              })
        else {
            return []
        }
        return devices
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
    }
}
