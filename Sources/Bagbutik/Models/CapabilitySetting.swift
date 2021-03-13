import Foundation

/// An object that represents a capability setting for an app.
public struct CapabilitySetting: Codable {
    public let allowedInstances: AllowedInstances?
    public let description: String?
    public let enabledByDefault: Bool?
    public let key: Key?
    public let minInstances: Int?
    public let name: String?
    public let options: [CapabilityOption]?
    public let visible: Bool?

    public init(allowedInstances: AllowedInstances? = nil, description: String? = nil, enabledByDefault: Bool? = nil, key: Key? = nil, minInstances: Int? = nil, name: String? = nil, options: [CapabilityOption]? = nil, visible: Bool? = nil) {
        self.allowedInstances = allowedInstances
        self.description = description
        self.enabledByDefault = enabledByDefault
        self.key = key
        self.minInstances = minInstances
        self.name = name
        self.options = options
        self.visible = visible
    }

    public enum AllowedInstances: String, Codable, CaseIterable {
        case entry = "ENTRY"
        case single = "SINGLE"
        case multiple = "MULTIPLE"
    }

    public enum Key: String, Codable, CaseIterable {
        case iCloudVersion = "ICLOUD_VERSION"
        case dataProtectionPermissionLevel = "DATA_PROTECTION_PERMISSION_LEVEL"
        case appleIdAuthAppConsent = "APPLE_ID_AUTH_APP_CONSENT"
    }
}
