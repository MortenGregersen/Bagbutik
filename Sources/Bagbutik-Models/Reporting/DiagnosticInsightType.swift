import Bagbutik_Core
import Foundation

public enum DiagnosticInsightType: String, Sendable, Codable, CaseIterable {
    case trend = "TREND"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DiagnosticInsightType(rawValue: string) {
            self = value
        } else if let value = DiagnosticInsightType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DiagnosticInsightType value: \(string)"
            )
        }
    }
}
