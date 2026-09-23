import BagbutikCore
import Foundation

/**
 # DiagnosticInsightType

 A string that desribes the diagnostic insight type.

 ```
 string DiagnosticInsightType
 ```

 ## Discussion

 -TREND: Represents an insight type that indicates how the impact of signatures has changed between the current version and previous versions.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticinsighttype>
 */
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
