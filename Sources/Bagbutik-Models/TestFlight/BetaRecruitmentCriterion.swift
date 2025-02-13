import Bagbutik_Core
import Foundation

/**
 # BetaRecruitmentCriterion
 The data structure that represents a beta recruitment criterion resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betarecruitmentcriterion>
 */
public struct BetaRecruitmentCriterion: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "betaRecruitmentCriteria" }
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

    public struct Attributes: Codable, Sendable {
        public var deviceFamilyOsVersionFilters: [DeviceFamilyOsVersionFilter]?
        public var lastModifiedDate: Date?

        public init(deviceFamilyOsVersionFilters: [DeviceFamilyOsVersionFilter]? = nil,
                    lastModifiedDate: Date? = nil)
        {
            self.deviceFamilyOsVersionFilters = deviceFamilyOsVersionFilters
            self.lastModifiedDate = lastModifiedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deviceFamilyOsVersionFilters = try container.decodeIfPresent([DeviceFamilyOsVersionFilter].self, forKey: "deviceFamilyOsVersionFilters")
            lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deviceFamilyOsVersionFilters, forKey: "deviceFamilyOsVersionFilters")
            try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
        }
    }
}
