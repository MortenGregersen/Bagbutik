import Bagbutik_Core
import Foundation

public enum CiExecutionProgress: String, Sendable, Codable, CaseIterable {
    case complete = "COMPLETE"
    case pending = "PENDING"
    case running = "RUNNING"
}
