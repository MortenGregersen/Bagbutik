import Bagbutik_Core
import Foundation

public enum CertificateType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case developerIdApplication = "DEVELOPER_ID_APPLICATION"
    case developerIdApplicationG2 = "DEVELOPER_ID_APPLICATION_G2"
    case developerIdKext = "DEVELOPER_ID_KEXT"
    case developerIdKextG2 = "DEVELOPER_ID_KEXT_G2"
    case development = "DEVELOPMENT"
    case distribution = "DISTRIBUTION"
    case iOSDevelopment = "IOS_DEVELOPMENT"
    case iOSDistribution = "IOS_DISTRIBUTION"
    case macAppDevelopment = "MAC_APP_DEVELOPMENT"
    case macAppDistribution = "MAC_APP_DISTRIBUTION"
    case macInstallerDistribution = "MAC_INSTALLER_DISTRIBUTION"
    case passTypeId = "PASS_TYPE_ID"
    case passTypeIdWithNfc = "PASS_TYPE_ID_WITH_NFC"
}
