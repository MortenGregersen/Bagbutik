import Bagbutik_Core
import Foundation

/**
 # CertificateType
 Literal values that represent types of signing certificates.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatetype>
 */
public enum CertificateType: String, ParameterValue, CaseIterable {
    case iOSDevelopment = "IOS_DEVELOPMENT"
    case iOSDistribution = "IOS_DISTRIBUTION"
    case macAppDistribution = "MAC_APP_DISTRIBUTION"
    case macInstallerDistribution = "MAC_INSTALLER_DISTRIBUTION"
    case macAppDevelopment = "MAC_APP_DEVELOPMENT"
    case developerIdKext = "DEVELOPER_ID_KEXT"
    case developerIdApplication = "DEVELOPER_ID_APPLICATION"
    case development = "DEVELOPMENT"
    case distribution = "DISTRIBUTION"
    case passTypeId = "PASS_TYPE_ID"
    case passTypeIdWithNfc = "PASS_TYPE_ID_WITH_NFC"
}
