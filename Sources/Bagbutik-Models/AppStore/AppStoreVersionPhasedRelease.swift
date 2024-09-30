import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionPhasedRelease
 The data structure that represent an App Store Version Phased Releases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease>
 */
public struct AppStoreVersionPhasedRelease: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreVersionPhasedReleases" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    /**
     # AppStoreVersionPhasedRelease.Attributes
     Attributes that describe an App Store Version Phased Releases resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedrelease/attributes>
     */
    public struct Attributes: Codable, Sendable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            currentDayNumber = try container.decodeIfPresent(Int.self, forKey: "currentDayNumber")
            phasedReleaseState = try container.decodeIfPresent(PhasedReleaseState.self, forKey: "phasedReleaseState")
            startDate = try container.decodeIfPresent(Date.self, forKey: "startDate")
            totalPauseDuration = try container.decodeIfPresent(Int.self, forKey: "totalPauseDuration")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(currentDayNumber, forKey: "currentDayNumber")
            try container.encodeIfPresent(phasedReleaseState, forKey: "phasedReleaseState")
            try container.encodeIfPresent(startDate, forKey: "startDate")
            try container.encodeIfPresent(totalPauseDuration, forKey: "totalPauseDuration")
        }
    }
}
