public extension CertificateType {
    var prettyName: String {
        switch self {
        case .development: return "Apple Development"
        case .distribution: return "Apple Distribution"
        case .iOSDevelopment: return "iOS App Development"
        case .iOSDistribution: return "iOS Distribution"
        case .macAppDistribution: return "Mac App Distribution"
        case .macInstallerDistribution: return "Mac Installer Distribution"
        case .macAppDevelopment: return "Mac Development"
        case .developerIdKext: return "Developer ID Installer"
        case .developerIdApplication: return "Developer ID Application"
        }
    }
}
