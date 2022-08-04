import Foundation
import Bagbutik_Core

/**
 # CapabilitySetting
 An object that  represents a capability setting for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/capabilitysetting>
 */
public struct CapabilitySetting: Codable {
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
