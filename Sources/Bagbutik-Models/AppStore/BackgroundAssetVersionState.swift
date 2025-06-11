import Bagbutik_Core
import Foundation

public enum BackgroundAssetVersionState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case processing = "PROCESSING"
}
