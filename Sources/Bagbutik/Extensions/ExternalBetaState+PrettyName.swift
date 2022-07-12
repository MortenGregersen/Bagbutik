public extension ExternalBetaState {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .processing: return "Processing"
        case .processingException: return "Processing Exception"
        case .missingExportCompliance: return "Missing Compliance"
        case .readyForBetaTesting: return "Ready to Test"
        case .inBetaTesting: return "Testing"
        case .expired: return "Expired"
        case .readyForBetaSubmission: return "Ready to Submit"
        case .inExportComplianceReview: return "Waiting for Export Compliance Review"
        case .waitingForBetaReview: return "Waiting for Review"
        case .inBetaReview: return "In Beta Review"
        case .betaRejected: return "Rejected"
        case .betaApproved: return "Approved"
        }
    }
}
