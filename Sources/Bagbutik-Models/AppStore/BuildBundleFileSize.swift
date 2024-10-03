import Bagbutik_Core
import Foundation

public struct BuildBundleFileSize: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "buildBundleFileSizes" }
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
        public var deviceModel: String?
        public var downloadBytes: Int?
        public var installBytes: Int?
        public var osVersion: String?

        public init(deviceModel: String? = nil,
                    downloadBytes: Int? = nil,
                    installBytes: Int? = nil,
                    osVersion: String? = nil)
        {
            self.deviceModel = deviceModel
            self.downloadBytes = downloadBytes
            self.installBytes = installBytes
            self.osVersion = osVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deviceModel = try container.decodeIfPresent(String.self, forKey: "deviceModel")
            downloadBytes = try container.decodeIfPresent(Int.self, forKey: "downloadBytes")
            installBytes = try container.decodeIfPresent(Int.self, forKey: "installBytes")
            osVersion = try container.decodeIfPresent(String.self, forKey: "osVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deviceModel, forKey: "deviceModel")
            try container.encodeIfPresent(downloadBytes, forKey: "downloadBytes")
            try container.encodeIfPresent(installBytes, forKey: "installBytes")
            try container.encodeIfPresent(osVersion, forKey: "osVersion")
        }
    }
}
