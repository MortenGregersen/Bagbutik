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

    /**
     Attributes that describe a Devices resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/device/attributes>
     */
    public struct Attributes: Codable {
        public let addedDate: Date?
        public let deviceClass: DeviceClass?
        public let model: String?
        public let name: String?
        public let platform: BundleIdPlatform?
        public let status: Status?
        public let udid: String?

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
