import BagbutikCore
import Foundation

/**
 # DiagnosticInsightDirection

 A string that describes the diagnostic insight direction.

 ```
 string DiagnosticInsightDirection
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticinsightdirection>
 */
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
