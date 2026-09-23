import BagbutikCore
import Foundation

/**
 # CiTestDestinationKind

 The string that represents the kind of a test destination.

 ```
 string CiTestDestinationKind
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestdestinationkind>
 */
public enum CiTestDestinationKind: String, Sendable, Codable, CaseIterable {
    case mac = "MAC"
    case simulator = "SIMULATOR"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiTestDestinationKind(rawValue: string) {
            self = value
        } else if let value = CiTestDestinationKind(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiTestDestinationKind value: \(string)"
            )
        }
    }
}
