import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionPhasedRelease
 The data structure that represent an App Store Version Phased Releases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease>
 */
public struct AppStoreVersionPhasedRelease: Codable, Identifiable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "appStoreVersionPhasedReleases" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # AppStoreVersionPhasedRelease.Attributes
     Attributes that describe an App Store Version Phased Releases resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease/attributes>
     */
    public struct Attributes: Codable {
        public var currentDayNumber: Int?
        public var phasedReleaseState: PhasedReleaseState?
        public var startDate: Date?
        public var totalPauseDuration: Int?

        public init(currentDayNumber: Int? = nil,
                    phasedReleaseState: PhasedReleaseState? = nil,
                    startDate: Date? = nil,
                    totalPauseDuration: Int? = nil)
        {
            self.currentDayNumber = currentDayNumber
            self.phasedReleaseState = phasedReleaseState
            self.startDate = startDate
            self.totalPauseDuration = totalPauseDuration
        }
    }
}
