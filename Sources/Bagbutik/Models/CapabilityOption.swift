import Foundation

/**
 An option within a capability setting.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/capabilityoption>
 */
public struct CapabilityOption: Codable {
    @NullCodable public var description: String?
    @NullCodable public var enabled: Bool?
    @NullCodable public var enabledByDefault: Bool?
    @NullCodable public var key: Key?
    @NullCodable public var name: String?
    @NullCodable public var supportsWildcard: Bool?

    public init(description: String? = nil, enabled: Bool? = nil, enabledByDefault: Bool? = nil, key: Key? = nil, name: String? = nil, supportsWildcard: Bool? = nil) {
        self.description = description
        self.enabled = enabled
        self.enabledByDefault = enabledByDefault
        self.key = key
        self.name = name
        self.supportsWildcard = supportsWildcard
    }

    public enum Key: String, Codable, CaseIterable {
        case xcode5 = "XCODE_5"
        case xcode6 = "XCODE_6"
        case completeProtection = "COMPLETE_PROTECTION"
        case protectedUnlessOpen = "PROTECTED_UNLESS_OPEN"
        case protectedUntilFirstUserAuth = "PROTECTED_UNTIL_FIRST_USER_AUTH"
        case primaryAppConsent = "PRIMARY_APP_CONSENT"
    }
}
