public extension BundleIdPlatform {
    var prettyName: String {
        switch self {
        case .iOS: return "iOS"
        case .macOS: return "macOS"
        case .universal: return "Universal"
        }
    }
}
