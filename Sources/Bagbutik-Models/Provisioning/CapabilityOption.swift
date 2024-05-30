import Bagbutik_Core
import Foundation

/**
 # CapabilityOption
 An option within a capability setting.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/capabilityoption>
 */
public struct CapabilityOption: Codable {
    public var description: String?
    public var enabled: Bool?
    public var enabledByDefault: Bool?
    public var key: Key?
    public var name: String?
    public var supportsWildcard: Bool?

    public init(description: String? = nil,
                enabled: Bool? = nil,
                enabledByDefault: Bool? = nil,
                key: Key? = nil,
                name: String? = nil,
                supportsWildcard: Bool? = nil)
    {
        self.description = description
        self.enabled = enabled
        self.enabledByDefault = enabledByDefault
        self.key = key
        self.name = name
        self.supportsWildcard = supportsWildcard
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        description = try container.decodeIfPresent(String.self, forKey: "description")
        enabled = try container.decodeIfPresent(Bool.self, forKey: "enabled")
        enabledByDefault = try container.decodeIfPresent(Bool.self, forKey: "enabledByDefault")
        key = try container.decodeIfPresent(Key.self, forKey: "key")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        supportsWildcard = try container.decodeIfPresent(Bool.self, forKey: "supportsWildcard")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(enabled, forKey: "enabled")
        try container.encodeIfPresent(enabledByDefault, forKey: "enabledByDefault")
        try container.encodeIfPresent(key, forKey: "key")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(supportsWildcard, forKey: "supportsWildcard")
    }

    public enum Key: String, Codable, CaseIterable {
        case completeProtection = "COMPLETE_PROTECTION"
        case primaryAppConsent = "PRIMARY_APP_CONSENT"
        case protectedUnlessOpen = "PROTECTED_UNLESS_OPEN"
        case protectedUntilFirstUserAuth = "PROTECTED_UNTIL_FIRST_USER_AUTH"
        case xcode5 = "XCODE_5"
        case xcode6 = "XCODE_6"
    }
}
