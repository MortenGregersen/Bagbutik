public extension CapabilityOption.Key {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .xcode5: return "Compatible with Xcode 5"
        case .xcode6: return "Include CloudKit support (requires Xcode 6)"
        case .completeProtection: return "Complete Protection"
        case .protectedUnlessOpen: return "Protected Unless Open"
        case .protectedUntilFirstUserAuth: return "Protected Until First User Authentication"
        case .primaryAppConsent: return "Enable as a primary App ID"
        }
    }
}
