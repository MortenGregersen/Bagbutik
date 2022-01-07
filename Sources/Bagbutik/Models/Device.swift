import Foundation

/**
 The data structure that represents a Devices resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/device>
 */
public struct Device: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "devices" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
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
        case id
        case links
        case type
        case attributes
    }

    /**
     Attributes that describe a Devices resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/device/attributes>
     */
    public struct Attributes: Codable {
        @NullCodable public var addedDate: Date?
        @NullCodable public var deviceClass: DeviceClass?
        @NullCodable public var model: String?
        @NullCodable public var name: String?
        @NullCodable public var platform: BundleIdPlatform?
        @NullCodable public var status: Status?
        @NullCodable public var udid: String?

        public init(addedDate: Date? = nil, deviceClass: DeviceClass? = nil, model: String? = nil, name: String? = nil, platform: BundleIdPlatform? = nil, status: Status? = nil, udid: String? = nil) {
            self.addedDate = addedDate
            self.deviceClass = deviceClass
            self.model = model
            self.name = name
            self.platform = platform
            self.status = status
            self.udid = udid
        }

        public enum DeviceClass: String, Codable, CaseIterable {
            case appleWatch = "APPLE_WATCH"
            case iPad = "IPAD"
            case iPhone = "IPHONE"
            case iPod = "IPOD"
            case appleTV = "APPLE_TV"
            case mac = "MAC"
        }

        public enum Status: String, Codable, CaseIterable {
            case enabled = "ENABLED"
            case disabled = "DISABLED"
        }
    }
}
