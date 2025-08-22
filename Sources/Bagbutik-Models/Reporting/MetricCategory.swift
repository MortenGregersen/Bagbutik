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

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = MetricCategory(rawValue: string) {
            self = value
        } else if let value = MetricCategory(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid MetricCategory value: \(string)"
            )
        }
    }
}
