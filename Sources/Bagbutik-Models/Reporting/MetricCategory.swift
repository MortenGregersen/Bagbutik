import Bagbutik_Core
import Foundation

public enum MetricCategory: String, Sendable, Codable, CaseIterable {
    case animation = "ANIMATION"
    case battery = "BATTERY"
    case disk = "DISK"
    case hang = "HANG"
    case launch = "LAUNCH"
    case memory = "MEMORY"
    case termination = "TERMINATION"
}
