public extension InternalBetaState {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .processing: return "Processing"
        case .processingException: return "Processing Exception"
        case .missingExportCompliance: return "Missing Compliance"
        case .readyForBetaTesting: return "Ready to Test"
        case .inBetaTesting: return "Testing"
        case .expired: return "Expired"
        case .inExportComplianceReview: return "Waiting for Export Compliance Review"
        }
    }
}
