public extension Profile.Attributes.ProfileType {
    var prettyName: String {
        switch self {
        case .iOSAppDevelopment: return "iOS App Development"
        case .iOSAppStore: return "iOS App Store"
        case .iOSAppAdhoc: return "iOS Ad Hoc"
        case .iOSAppInhouse: return "iOS In House"
        case .macAppDevelopment: return "macOS App Development"
        case .macAppStore: return "Mac App Store"
        case .macAppDirect: return "Developer ID"
        case .tvosAppDevelopment: return "tvOS App Development"
        case .tvosAppStore: return "tvOS App Store"
        case .tvosAppAdhoc: return "tvOS Ad Hoc"
        case .tvosAppInhouse: return "tvOS In House"
        case .macCatalystAppDevelopment: return "macOS Catalyst App Development"
        case .macCatalystAppStore: return "macOS Catalyst App Store"
        case .macCatalystAppDirect: return "macOS Catalyst Developer ID"
        }
    }
}
