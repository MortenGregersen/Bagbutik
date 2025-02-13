import Bagbutik_Core
import Foundation

public struct BetaRecruitmentCriterionOption: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "betaRecruitmentCriterionOptions" }
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
        public var deviceFamilyOsVersions: [DeviceFamilyOsVersions]?

        public init(deviceFamilyOsVersions: [DeviceFamilyOsVersions]? = nil) {
            self.deviceFamilyOsVersions = deviceFamilyOsVersions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deviceFamilyOsVersions = try container.decodeIfPresent([DeviceFamilyOsVersions].self, forKey: "deviceFamilyOsVersions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deviceFamilyOsVersions, forKey: "deviceFamilyOsVersions")
        }

        public struct DeviceFamilyOsVersions: Codable, Sendable {
            public var deviceFamily: DeviceFamily?
            public var osVersions: [String]?

            public init(deviceFamily: DeviceFamily? = nil,
                        osVersions: [String]? = nil)
            {
                self.deviceFamily = deviceFamily
                self.osVersions = osVersions
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                deviceFamily = try container.decodeIfPresent(DeviceFamily.self, forKey: "deviceFamily")
                osVersions = try container.decodeIfPresent([String].self, forKey: "osVersions")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(deviceFamily, forKey: "deviceFamily")
                try container.encodeIfPresent(osVersions, forKey: "osVersions")
            }
        }
    }
}
