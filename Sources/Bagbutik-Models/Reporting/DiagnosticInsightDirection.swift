import Bagbutik_Core
import Foundation

public enum DiagnosticInsightDirection: String, Sendable, Codable, CaseIterable {
    case down = "DOWN"
    case undefined = "UNDEFINED"
    case up = "UP"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DiagnosticInsightDirection(rawValue: string) {
            self = value
        } else if let value = DiagnosticInsightDirection(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DiagnosticInsightDirection value: \(string)"
            )
        }
    }
}
