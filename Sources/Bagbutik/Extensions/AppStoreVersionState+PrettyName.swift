public extension AppStoreVersionState {
    var prettyName: String {
        switch self {
        case .developerRejected: return "Developer Rejected"
        case .developerRemovedFromSale: return "Developer Removed from Sale"
        case .inReview: return "In Review"
        case .invalidBinary: return "Invalid Binary"
        case .metadataRejected: return "Metadata Rejected"
        case .pendingAppleRelease: return "Pending Apple Release"
        case .pendingContract: return "Pending Agreement"
        case .pendingDeveloperRelease: return "Pending Developer Release"
        case .prepareForSubmission: return "Prepare for Submission"
        case .preorderReadyForSale: return "Pre-Order Ready for Sale"
        case .processingForAppStore: return "Processing for App Store"
        case .readyForSale: return "Ready for Sale"
        case .rejected: return "Rejected"
        case .removedFromSale: return "Removed from Sale"
        case .waitingForExportCompliance: return "Waiting for Export Compliance"
        case .waitingForReview: return "Waiting for Review"
        case .replacedWithNewVersion: return "Replaced with New Version"
        }
    }
}
