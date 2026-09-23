import BagbutikCore
import Foundation

/**
 # MetricCategory

 Categories of metric reports for apps that you distribute through the App Store.

 ```
 string MetricCategory
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/metriccategory>
 */
public enum MetricCategory: String, Sendable, Codable, CaseIterable {
    case animation = "ANIMATION"
    case battery = "BATTERY"
    case disk = "DISK"
    case hang = "HANG"
    case launch = "LAUNCH"
    case memory = "MEMORY"
    case storage = "STORAGE"
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
