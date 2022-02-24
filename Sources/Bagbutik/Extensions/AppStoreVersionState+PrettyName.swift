public extension AppStoreVersionState {
    /// A pretty name for the case. The names are added as best effort, and a better name could exist.
    var prettyName: String {
        switch self {
        case .accepted: return "Accepted"
        case .developerRejected: return "Developer Rejected"
        case .developerRemovedFromSale: return "Developer Removed from Sale"
        case .inReview: return "In Review"
        case .invalidBinary: return "Invalid Binary"
        case .metadataRejected: return "Metadata Rejected"
        case .pendingAppleRelease: return "Pending Apple Release"
        case .pendingContract: return "Pending Agreement"
        case .pendingDeveloperRelease: return "Pending Developer Release"
        case .preorderReadyForSale: return "Pre-Order Ready for Sale"
        case .prepareForSubmission: return "Prepare for Submission"
        case .processingForAppStore: return "Processing for App Store"
        case .readyForReview: return "Ready for Review"
        case .readyForSale: return "Ready for Sale"
        case .rejected: return "Rejected"
        case .removedFromSale: return "Removed from Sale"
        case .replacedWithNewVersion: return "Replaced with New Version"
        case .waitingForExportCompliance: return "Waiting for Export Compliance"
        case .waitingForReview: return "Waiting for Review"
        }
    }
}
