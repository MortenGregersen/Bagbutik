import Foundation

public enum CertificateType: String, Codable, CaseIterable {
    case iOSDevelopment = "IOS_DEVELOPMENT"
    case iOSDistribution = "IOS_DISTRIBUTION"
    case macAppDistribution = "MAC_APP_DISTRIBUTION"
    case macInstallerDistribution = "MAC_INSTALLER_DISTRIBUTION"
    case macAppDevelopment = "MAC_APP_DEVELOPMENT"
    case developerIdKext = "DEVELOPER_ID_KEXT"
    case developerIdApplication = "DEVELOPER_ID_APPLICATION"
    case development = "DEVELOPMENT"
    case distribution = "DISTRIBUTION"
}
