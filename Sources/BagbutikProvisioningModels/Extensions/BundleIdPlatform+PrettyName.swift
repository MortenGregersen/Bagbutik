public extension BundleIdPlatform {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .iOS: return "iOS"
        case .macOS: return "macOS"
        case .services: return "Service"
        case .universal: return "Universal"
        }
    }
}
