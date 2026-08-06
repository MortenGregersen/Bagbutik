public extension ExternalBetaState {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .processing: "Processing"
        case .processingException: "Processing Exception"
        case .missingExportCompliance: "Missing Compliance"
        case .readyForBetaTesting: "Ready to Test"
        case .inBetaTesting: "Testing"
        case .expired: "Expired"
        case .readyForBetaSubmission: "Ready to Submit"
        case .inExportComplianceReview: "Waiting for Export Compliance Review"
        case .waitingForBetaReview: "Waiting for Review"
        case .inBetaReview: "In Beta Review"
        case .betaRejected: "Rejected"
        case .betaApproved: "Approved"
        case .notApplicable: "Not Applicable"
        }
    }
}
