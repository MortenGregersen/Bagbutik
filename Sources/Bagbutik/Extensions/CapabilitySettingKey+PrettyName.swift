public extension CapabilitySetting.Key {
    var prettyName: String {
        switch self {
        case .iCloudVersion: return "iCloud Version"
        case .dataProtectionPermissionLevel: return "Data Protection Permission Level"
        case .appleIdAuthAppConsent: return "App ID Configuration"
        }
    }
}
