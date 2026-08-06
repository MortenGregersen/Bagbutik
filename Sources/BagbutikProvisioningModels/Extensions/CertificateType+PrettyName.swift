public extension CertificateType {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .development: "Apple Development"
        case .distribution: "Apple Distribution"
        case .iOSDevelopment: "iOS App Development"
        case .iOSDistribution: "iOS Distribution"
        case .macAppDistribution: "Mac App Distribution"
        case .macInstallerDistribution: "Mac Installer Distribution"
        case .macAppDevelopment: "Mac Development"
        case .developerIdKext: "Developer ID Installer"
        case .developerIdKextG2: "Developer ID Installer G2"
        case .developerIdApplication: "Developer ID Application Previous Sub-CA"
        case .developerIdApplicationG2: "Developer ID Application G2 Sub-CA"
        case .passTypeId: "Pass Type ID Certificate"
        // Not mentioned in documentation: https://developer.apple.com/support/certificates
        case .passTypeIdWithNfc: "Pass Type ID with NFC Certificate"
        case .applePay: "Apple Pay Payment Processing Certificate"
        case .applePayMerchantIdentity: "Apple Pay Merchant Identity Certificate"
        case .applePayPspIdentity: "Apple Pay Payment Service Provider Identity Certificate"
        case .applePayRsa: "Apple Pay RSA Certificate"
        case .identityAccess: "Identity Access Certificate"
        }
    }
}
