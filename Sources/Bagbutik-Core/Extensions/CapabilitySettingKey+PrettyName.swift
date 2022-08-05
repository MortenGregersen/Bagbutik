public extension CapabilitySetting.Key {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .iCloudVersion: return "iCloud Version"
        case .dataProtectionPermissionLevel: return "Data Protection Permission Level"
        case .appleIdAuthAppConsent: return "App ID Configuration"
        }
    }
}
