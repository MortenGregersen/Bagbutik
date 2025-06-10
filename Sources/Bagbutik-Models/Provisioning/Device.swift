import Bagbutik_Core
import Foundation

/**
 # Device
 The data structure that represents a Devices resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/device>
 */
public struct Device: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "devices" }
    /// The resource’s attributes.
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
        public var addedDate: Date?
        public var deviceClass: DeviceClass?
        public var model: String?
        public var name: String?
        public var platform: BundleIdPlatform?
        public var status: Status?
        public var udid: String?

        public init(addedDate: Date? = nil,
                    deviceClass: DeviceClass? = nil,
                    model: String? = nil,
                    name: String? = nil,
                    platform: BundleIdPlatform? = nil,
                    status: Status? = nil,
                    udid: String? = nil)
        {
            self.addedDate = addedDate
            self.deviceClass = deviceClass
            self.model = model
            self.name = name
            self.platform = platform
            self.status = status
            self.udid = udid
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            addedDate = try container.decodeIfPresent(Date.self, forKey: "addedDate")
            deviceClass = try container.decodeIfPresent(DeviceClass.self, forKey: "deviceClass")
            model = try container.decodeIfPresent(String.self, forKey: "model")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            platform = try container.decodeIfPresent(BundleIdPlatform.self, forKey: "platform")
            status = try container.decodeIfPresent(Status.self, forKey: "status")
            udid = try container.decodeIfPresent(String.self, forKey: "udid")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(addedDate, forKey: "addedDate")
            try container.encodeIfPresent(deviceClass, forKey: "deviceClass")
            try container.encodeIfPresent(model, forKey: "model")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(status, forKey: "status")
            try container.encodeIfPresent(udid, forKey: "udid")
        }

        public enum DeviceClass: String, Sendable, Codable, CaseIterable {
            case appleTV = "APPLE_TV"
            case appleVisionPro = "APPLE_VISION_PRO"
            case appleVisionPro = "APPLE_VISION_PRO"
            case appleWatch = "APPLE_WATCH"
            case iPad = "IPAD"
            case iPhone = "IPHONE"
            case iPod = "IPOD"
            case mac = "MAC"
        }

        public enum Status: String, Sendable, ParameterValue, Codable, CaseIterable {
            case disabled = "DISABLED"
            case enabled = "ENABLED"
            case processing = "PROCESSING"
        }
    }
}
