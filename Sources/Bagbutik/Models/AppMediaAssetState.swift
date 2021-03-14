import Foundation

/// The state of an app or media upload, including any errors and warnings.
public struct AppMediaAssetState: Codable {
    public let errors: [AppMediaStateError]?
    public let state: State?
    public let warnings: [AppMediaStateError]?

    public init(errors: [AppMediaStateError]? = nil, state: State? = nil, warnings: [AppMediaStateError]? = nil) {
        self.errors = errors
        self.state = state
        self.warnings = warnings
    }

    public enum State: String, Codable, CaseIterable {
        case awaitingUpload = "AWAITING_UPLOAD"
        case uploadComplete = "UPLOAD_COMPLETE"
        case complete = "COMPLETE"
        case failed = "FAILED"
    }
}
