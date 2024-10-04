import Bagbutik_Core
import Foundation

/**
 # CapabilitySetting
 An object that  represents a capability setting for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/capabilitysetting>
 */
public struct CapabilitySetting: Codable, Sendable {
    public var allowedInstances: AllowedInstances?
    public var description: String?
    public var enabledByDefault: Bool?
    public var key: Key?
    public var minInstances: Int?
    public var name: String?
    public var options: [CapabilityOption]?
    public var visible: Bool?

    public init(allowedInstances: AllowedInstances? = nil,
                description: String? = nil,
                enabledByDefault: Bool? = nil,
                key: Key? = nil,
                minInstances: Int? = nil,
                name: String? = nil,
                options: [CapabilityOption]? = nil,
                visible: Bool? = nil)
    {
        self.allowedInstances = allowedInstances
        self.description = description
        self.enabledByDefault = enabledByDefault
        self.key = key
        self.minInstances = minInstances
        self.name = name
        self.options = options
        self.visible = visible
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        allowedInstances = try container.decodeIfPresent(AllowedInstances.self, forKey: "allowedInstances")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        enabledByDefault = try container.decodeIfPresent(Bool.self, forKey: "enabledByDefault")
        key = try container.decodeIfPresent(Key.self, forKey: "key")
        minInstances = try container.decodeIfPresent(Int.self, forKey: "minInstances")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        options = try container.decodeIfPresent([CapabilityOption].self, forKey: "options")
        visible = try container.decodeIfPresent(Bool.self, forKey: "visible")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(allowedInstances, forKey: "allowedInstances")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(enabledByDefault, forKey: "enabledByDefault")
        try container.encodeIfPresent(key, forKey: "key")
        try container.encodeIfPresent(minInstances, forKey: "minInstances")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(options, forKey: "options")
        try container.encodeIfPresent(visible, forKey: "visible")
    }

    public enum AllowedInstances: String, Sendable, Codable, CaseIterable {
        case entry = "ENTRY"
        case multiple = "MULTIPLE"
        case single = "SINGLE"
    }

    public enum Key: String, Sendable, Codable, CaseIterable {
        case appleIdAuthAppConsent = "APPLE_ID_AUTH_APP_CONSENT"
        case dataProtectionPermissionLevel = "DATA_PROTECTION_PERMISSION_LEVEL"
        case iCloudVersion = "ICLOUD_VERSION"
    }
}
